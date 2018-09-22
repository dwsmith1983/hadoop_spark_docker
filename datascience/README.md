# Data Science
This image is for those who wish to use Python's machine learning frameworks. We
are installing Tensorflow, Keras, pyTorch, Scikit-Spark, and openCV. If you
would prefer not to use one of the frameworks, simply remove them from the
`Dockerfile` and rebuild the image.

We also only installed the CPU versions of Keras, Tensorflow, and PyTorch. If
you are using GPUs in your cluster, just update the `Dockerfile` with the
correct installs and rebuild this image.

Additionally, we have a `requirements.txt` file that can updated with any
packages one may need for their work flow.
