set ProdLines ;
set Models ;
set ModelsLines ;


param   fixedCost{ProdLines}  ;
param   ProdCapability{ProdLines}  ;
param   Profit{Models,ProdLines} ;
param   Demand{Models}  ;
param   DemandChange{Models,Models} ;

var x{ProdLines} binary >=0  ;
var numCars{ModelsLines} integer >=0  ;
var diffBasic integer >=0 ;
var diffShowOff integer >=0 ;
var diffLuxurious integer >=0 ;       


maximize TotalProfit :
         Profit['BasicM','Basic']*numCars['B_B']  +  Profit['ShowOffM','ShowOff']*numCars['SO_SO']  
     +   Profit['LuxuriousM','Luxurious']*numCars['L_L']  +  Profit['BasicM','NewBasic']*numCars['B_NB']
     +   Profit['ShowOffM','NewBasic']*numCars['SO_NB']   +  Profit['BasicM','NewShowOff']*numCars['B_NSO']
     +   Profit['ShowOffM','NewShowOff']*numCars['SO_NSO'] + Profit['LuxuriousM','NewShowOff']*numCars['L_NSO']
     -   sum{iC in ProdLines}(fixedCost[iC]*x[iC]) ;
     
          
subject to Basic_OR_NewBasic :                           # The line can be modernized or not -- Basic or New Basic
                  x['Basic'] + x['NewBasic'] = 1 ;
subject to ShowOff_OR_NewShowOff :                       # The line can be modernized or not -- Show Off or New Show Off
                  x['ShowOff'] + x['NewShowOff'] = 1 ;                               
subject to Luxurious_Always :                            # Luxurious Line cannot  be modernized
                 x['Luxurious'] = 1 ; 
subject to C4 :                                          # Always have 3 production lines
                 sum{iP in ProdLines}(x[iP])<=3 ;


subject to numberCars_B_B   :    
                   numCars['B_B'] <= x['Basic']*ProdCapability['Basic'] ;    
                   
subject to numberCars_SO_SO :    
                   numCars['SO_SO']  <=  x['ShowOff'] * 
                   ( ProdCapability['ShowOff'] - DemandChange['BasicM','ShowOffM']*diffBasic ) ;   
                     
subject to numberCars_L_L :    
                   numCars['L_L'] <= x['Luxurious'] * ( ProdCapability['Luxurious'] - DemandChange['BasicM','LuxuriousM']*diffBasic 
                   - DemandChange['ShowOffM','LuxuriousM']*diffShowOff ) ;
                   
subject to numberCars_B_SO_NB :    
                   numCars['B_NB'] + numCars['SO_NB'] <= x['NewBasic']*ProdCapability['NewBasic'] ;
                   
subject to numberCars_B_SO_L_NSO :  
                   numCars['B_NSO'] + numCars['SO_NSO'] + numCars['L_NSO'] 
                  <= x['NewShowOff'] * ( ProdCapability['NewShowOff']- DemandChange['ShowOffM','LuxuriousM']*diffShowOff 
                  - DemandChange['BasicM','LuxuriousM']*diffBasic - DemandChange['BasicM','ShowOffM']*diffBasic )  ;

                
subject to   DemandBasic :
             x['Basic']*numCars['B_B'] + x['NewBasic']*numCars['B_NB'] + x['NewShowOff']*numCars['B_NSO']
           + diffBasic = Demand['BasicM'] ;
 
subject to   DemandShowOff :
             x['ShowOff']*numCars['SO_SO'] + x['NewBasic']*numCars['SO_NB'] + x['NewShowOff']*numCars['SO_NSO'] 
           + DemandChange['BasicM','ShowOffM']*diffBasic + diffShowOff = Demand['ShowOffM'] ;
          
subject to   DemandLuxurious :
             x['Luxurious']*numCars['L_L'] + x['NewShowOff']*numCars['L_NSO'] + DemandChange['BasicM','LuxuriousM']*diffBasic    
           + DemandChange['ShowOffM','LuxuriousM']*diffShowOff = Demand['LuxuriousM'] ;                 
       
                   
        