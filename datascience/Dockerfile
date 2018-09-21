FROM dwsmith1983/anaconda

USER root

ADD requirements.txt /requirements.txt
ADD conda_requirement_install.sh /conda_requirement_install.sh
RUN chmod a+x /conda_requirement_install.sh
RUN ["sh", "/conda_requirement_install.sh"]

RUN conda upgrade -y conda anaconda --a \
  && conda install -c anaconda pip \
  && conda install -y pyspark \
  && pip install opencv-python \
  && pip install scikit-spark \
  && conda install -y -c conda-forge keras tensorflow ipdb \
  && conda install -y pytorch-cpu torchvision-cpu -c pytorch \
  && conda clean -y --a
