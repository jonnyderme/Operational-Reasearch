set   Component ;
set   Sequence ;
set   Procedure ;

param    ProcessTime{Procedure,Component} ;

var rank{Component,Sequence} binary ;
var completionTime{Sequence} integer >=0 ;
var Time{Sequence,Procedure} integer >=0 ;
var wait{Sequence,Procedure} integer :=0  ;  # waiting time of procedure between j and j+1 ordered component

minimize TotalTime :
         completionTime[6]   ;
         
 

subject to  C1{iS in Sequence} : 
                 sum{iC in Component}(rank[iC,iS]) = 1 ;
      
subject to  C2{iComp in Component} :
                 sum{iS in Sequence}(rank[iComp,iS]) = 1 ;
         
subject to  ProTime{iProc in Procedure, iSeq in Sequence}  :             # process time in every procedure (for iProc sequenced component)
            Time[iSeq,iProc] = sum{iC in Component}(rank[iC,iSeq]*ProcessTime[iProc,iC]) ; 

                 
subject to WaitTime1{iP in Procedure} :
           wait[1,iP] = 0 ;
           
           
subject to WaitTimeCasting{iS in 2..card(Sequence)} :     # wait time at casting for the components from 2nd position to 6th 
           wait[iS,'Casting'] = sum{iSeq in 1..(iS-1)}(Time[iSeq,'Casting'] )     ;  
           

subject to WaitTimeGrinding{iS in 2..card(Sequence)} :   # wait time at grinding for the components from 2nd position to 6th
           wait[iS,'Grinding'] =
           if ( wait[iS,'Casting']+Time[iS,'Casting'] < wait[iS-1,'Grinding']+wait[iS-1,'Casting']+Time[iS-1,'Casting']+Time[iS-1,'Grinding']) 
               then  Time[iS-1,'Casting'] + Time[iS-1,'Grinding']+wait[iS-1,'Casting']+wait[iS-1,'Grinding']  - ( wait[iS,'Casting']+Time[iS,'Casting'] )
               else  0   ;                            
               
subject to WaitTimeConnection{iS in 2..card(Sequence)} :   # wait time at grinding for the components from 2nd position to 6th
           wait[iS,'Connection'] = 
           if ( wait[iS,'Casting']+wait[iS,'Grinding']+Time[iS,'Casting']+Time[iS,'Grinding'] <
                wait[iS-1,'Casting']+wait[iS-1,'Grinding']+Time[iS-1,'Casting']+Time[iS-1,'Grinding']+wait[iS-1,'Connection']+Time[iS-1,'Connection'] )
                then   wait[iS-1,'Casting']+wait[iS-1,'Grinding']+Time[iS-1,'Casting']+Time[iS-1,'Grinding']+wait[iS-1,'Connection']+Time[iS-1,'Connection'] - (wait[iS,'Casting']+wait[iS,'Grinding']+Time[iS,'Casting']+Time[iS,'Grinding'])
                else   0   ;
  
subject to CompletionTime{iS in Sequence} :    # total completion time for every component (wait + Process time)
           completionTime[iS] = sum{iP in Procedure}( wait[iS,iP] +Time[iS,iP])   ;              
