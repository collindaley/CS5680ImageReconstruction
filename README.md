# Image Reconstruction Using Gray-scale Morphology and Marker-Controlled Watershed Transformation. 
This project is an implementation of the academic journal available at
* [Hindawi] https://www.hindawi.com/journals/ddns/2008/384346/#eq10.

### Stage 1:
* During this stage of the project, I have found one MR image that is similar to the one used in the paper. <br />
* I have implemented a simple gradient. I plan on going back later and implementing a multi-scale edge detection algorithm to create the gradient. I am still working on how to implement this. 
* I have implemented foreground marker detection using appropriate matlab functions.
* Regional maxima of the foreground marker has been calculated, isolating the foreground objects (in this case potential tumors). <br />
All above steps have been implemented in MainScript.m and have comments explaining each step listed above. \
It is important to note that the compliments of the images were needed to allow the dilation-based reconstruction to trace the foreground objects.\
