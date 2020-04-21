# Magnetic-Cell-Delivery-Simulations
Supplementary material for paper: Modelling and prediction of systemic delivery of SPION labelled Mesenchymal stromal cells by mathematical and experimental methods (2020)

Contents:

COMSOL files (requires COMSOL lisence along with 'Laminar Flow','Moving Mesh' packages)
1) main.mph  
2) Numerical-convergence-tests.mph

MATLAB Files for figure production (requires MATLAB lisence)
3) parampaper.m
4) figurespaper.m

Raw Data exported from COMSOL


1) main file runs all simulations for data presented in paper.
Each figure is produced by a different 'study' appropriately labeled. Data for each figure is plotted in the results section. Data was then exported to MATLAB to provide uniform formatting and visualisation.

2) Numerical verification file to suport main file.
Model unchanged, mesh convergence is tested through simulations with increasingly fine meshes. 
Results sensitivity to the approximate parameter 'delta' is tested.

3) Contains parameters used to create dimensional plots. These parameters are in the appendix of the paper.

4) Figure production for paper. Imports text files and uses parameters from parampaper.m. Each figure is produced by excecuting a section of code.


