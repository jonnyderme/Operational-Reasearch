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
## 📚 Table of Contents
- [🛠️ Computational Assignment – Autokinisi S.A.](#️-computational-assignment--autokinisi-sa)
- [🤖 Bibliographical Assignment – Autonomous Mobile Robots](#-bibliographical-assignment--autonomous-mobile-robots)
- [📁 Repository Structure](#-repository-structure)

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

- `exercise1ORProj2023.mod` – Component sequencing optimizer  
- `exercise2ORProj2023.mod` – Line upgrade and production allocation model  
- `README.md` – Project documentation  
- `ex1Data/` – Input data files (if applicable) for Exercise 1
- `ex2Data/` – Input data files (if applicable) for Exercise 2

---

# Bibliographical Assignment

---
# 🤖 Autonomous Mobile Robots – Presentation 
 

## 🧭 Overview  
Presentation on AMRs in intralogistics and smart environments.  
Topics include evolution from AGVs, path planning, task scheduling, and future research.

## ⚙️ Key Topics  
- A* / D*Lite algorithms  
- MILP / Network Flow modeling  
- Decentralized navigation  
- SLAM & AI-driven autonomy  

## 📁 Files  
- `autonomus mobile robots.pdf` – Final presentation  
- `README.md` – Project summary  

