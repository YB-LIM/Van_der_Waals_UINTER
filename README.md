# Van_der_Waals_UINTER
UINTER subroutine to model Van der Waals interaction on macro scopic scale <br>
The implementation is based on Coarse-Grained Contact Model proposed by Sauer and Li, 2007<br>
Written on Intel® Fortran Version 19.0.5 (Abaqus 2023) <br><br>
AUTHOR: Youngbin LIM<br>
CONTACT: lyb0684@naver.com

# Validation - Spherical indentation
Abaqus result was compared with analytical Johnson-Kendall-Roberts (JKR) model for spherical indentation <br><br>
![그림14](https://github.com/YB-LIM/Van_der_Waals_UINTER/assets/105615106/a781c1ab-e824-4c22-82b5-d6d06eca2157) <br>
![Honeycam 2024-05-03 19-40-38](https://github.com/YB-LIM/Van_der_Waals_UINTER/assets/105615106/21944401-6b42-4f9d-a7f4-c81a1b8678c1)


# References
[1] Abaqus Documentation, 2024, Dassault Systèmes Simulia Corp., Providence, RI, USA. <br>
[2] Sauer RA, Li S, 2007, An atomic interaction-based continuum model for adhesive contact mechanics, Finite Elements in Analysis and Design 43, 384-396 <br>
​[3] Sauer RA, Wriggers P, 2009, Formulation and analysis of a three dimensional finite element implementation for adhesive contact at the nanoscale, Computer Methods in Applied Mechanics and Engineering 198, 3871-3883. <br>
[4] Gaffari R, Dong TX, Sauer RA, 2018, A new shell formulation for graphene structures based on existing ab-initio data, International Journal of Solids and Structures 135, 37-60. <br>
