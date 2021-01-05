# Magnetic-Cell-Delivery-Simulations
Supplementary material for paper: Experimental and mathematical modelling of magnetically labelled mesenchymal stromal cell delivery (2020) Author: E. Yeo, H. Markides, A.T. Schade, A.J. Studd, J.M. Oliver, S.L. Waters, A.J. El Haj
Author of files in this repository: E. Yeo

Contents:

COMSOL files (requires COMSOL lisence along with 'Laminar Flow','Moving Mesh' packages)
1) main.mph  
2) Numerical_tests.mph

MATLAB Files for figure production (requires MATLAB lisence)
3) param.m
4) plots.m
5) Data

Raw Data exported from COMSOL


1) main file runs all simulations for data presented in paper.
Each figure is produced by a different 'study' appropriately labeled. Data for each figure is plotted in the results section. Data was then exported to MATLAB to provide uniform formatting and visualisation.

2) Numerical verification file to suport main file.
Model unchanged, mesh convergence is tested through simulations with increasingly fine meshes. 
Results sensitivity to the approximate parameter 'delta' is tested.

3) Contains parameters used to create dimensional plots. These parameters are in the appendix of the paper.

4) Figure production for paper. Imports text files and uses parameters from param.m. Each figure is produced by excecuting a section of code.

5) Contains the data exported from COMSOL required to run 4). 

