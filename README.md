# 5-Bar Planar Parallel Robot – MATLAB Kinematics & Vision-Guided Control

This repository contains MATLAB scripts, simulation files, and documentation for the design and implementation of a **5-bar planar parallel robotic system**.  
Developed as part of my **Robot Design and Implementation** coursework at the University of Sussex, this project demonstrates skills in **robot kinematics, motion planning, and vision-guided control**.

---

## 📌 Project Overview

The objective was to create a robotic system capable of **assembling personalised chocolate trays** from items arriving on a conveyor.  
The solution integrates:

- **Forward & Inverse Kinematics** for precise end-effector control.
- **Trajectory generation** for smooth motion execution.
- **Vision-based perception** to identify and place items based on colour classification.
- **Custom end-effector design** with force sensing and pneumatic actuation for compliant handling.

---

## 🛠 Features

- **Forward Kinematics** (`ForwardKinematics.m`, `ForwardKinematicsRight.m`)  
  Computes the end-effector position from servo input angles using a geometric approach.

- **Inverse Kinematics** (`InverseKinematics.m`)  
  Determines required joint angles for a target end-effector position.

- **Workspace Visualisation** (`PlotLinks.m`)  
  Plots robot link configurations and reachable workspace in simulated environment for visualisation.

- **Shape Path Generation** (`CircleXY.m`, `SquareXY.m`)  
  Creates coordinate paths for test shapes to validate trajectory tracking.

- **Angle Mapping** (`AngleMapping.m`)  
  Maps workspace coordinates to joint space for control execution.

- **Main Simulation Script** (`Main.m`)  
  Integrates kinematic calculations, path generation, and plotting for simulation or hardware demo.

---

## 📂 Repository Structure

