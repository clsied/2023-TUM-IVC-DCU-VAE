# TUM Image and Video Compression Laboratory Final Project: DCU-VAE

This repository is a summary of the final project under the TUM Image and Video Compression Laboratory.

## Overview
### Why DCU-VAE is Proposed

The DCU-VAE is proposed for the following reasons:

1. **Dilated Kernels for Efficient Downsampling**  
   Traditional convolutional kernels increase the receptive field by enlarging the kernel size, which increases the number of parameters. In contrast, dilated kernels allow for efficient downsampling while maintaining global structure, reducing computational resource consumption.

2. **Overcoming Error Accumulation in Sequential VAE**  
   Traditional VAEs are sequential in nature, where decoding from downsampled images can make it difficult to recover high-frequency details. Furthermore, in the approach proposed in ![*Variational Image Compression with a Scale Hyperprior*](https://arxiv.org/abs/1802.01436), each layer's prior is conditioned on the output of the previous layer. If there is an error in the earlier layer, it accumulates and affects the later stages. To address this, a U-Net-like architecture with skip connections is adopted to provide multi-scale priors and mitigate error propagation.

### DCU-VAE Architecture    
<img src="https://github.com/clsied/2023-TUM-IVC-DCU-VAE/blob/main/asset/dcu%20vae.png" width="400"/>

### Results
The training is mainly on the ![COCO 2014 dataset](https://cocodataset.org/#download)

<img src="https://github.com/clsied/2023-TUM-IVC-DCU-VAE/blob/main/asset/results.png" width="400"/>

### References
- Ballé, J., Minnen, D., Singh, S., Hwang, S. J., & Johnston, N. (2018). *Variational image compression with a scale hyperprior*. arXiv:1802.01436. [Link](https://arxiv.org/abs/1802.01436).
- Kingma, D. P., Welling, M. (2013). *Auto-encoding variational bayes*. arXiv:1312.6114. [Link](https://arxiv.org/abs/1312.6114).
- Wang, Z., Zou, Y., & Liu, P. X. (2021). *Hybrid dilation and attention residual U-Net for medical image segmentation*. Computers in Biology and Medicine, 134, 104449. [Link](https://doi.org/10.1016/j.compbiomed.2021.104449).
- [Train a Variational Autoencoder (VAE) to Generate Images](https://www.mathworks.com/help/deeplearning/ug/train-a-variational-autoencoder-vae-to-generate-images.html), MathWorks Documentation.
