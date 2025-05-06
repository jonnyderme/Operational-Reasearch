# Operational-Reasearch
---
# 🧠 Operational Research Assignments (2023)
Assignments for the "Operational Research" Course  
Faculty of Engineering, AUTh  
School of Electrical and Computer Engineering  
Electronics and Computers Department

📚 *Course:* Operational Research  
🏛️ *Faculty:* AUTh - School of Electrical and Computer Engineering  
📅 *Semester:* 8th Semester, 2024–2025

---

# Computational Assignment

---

## Company: Autokinisi S.A.

### 🔧 Part A – Component Scheduling

Autokinisi S.A. is planning the optimal scheduling of six components. Each component undergoes three sequential processes:  
1. Casting  
2. Grinding  
3. Assembly  

Each process is handled by a dedicated machine (one at a time, no preemption). The goal is to determine the best sequence of component processing to **minimize total completion time** ⏱️.

---

### 🚗 Part B – Production Line Planning

The company operates three production lines for three models:  
- Basic  
- ShowOff  
- Luxurious  

Due to increased demand, management is considering **upgrading** the Basic and/or ShowOff lines. Upgraded lines offer:  
✅ More capacity  
❗ Higher fixed costs  
📈 Higher profit margins  

Some unmet demand may shift to more premium models based on customer behavior.

🎯 **Goal:** Decide whether to upgrade production lines and how to allocate manufacturing to **maximize annual profit**.

---

## Tools Used

- AMPL  
- Linear/Mixed Integer Programming   
- Solvers: CBC / GLPK / Gurobi

---

## File Structure

- `scheduling.py` – Component sequencing optimizer  
- `production_planning.py` – Line upgrade and production allocation model  
- `README.md` – Project documentation  
- `data/` – Input data files (if applicable) for Exercise 1
- - `data/` – Input data files (if applicable) for Exercise 2

