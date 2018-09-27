FROM dwsmith1983/hadoop_spark_docker_swarm.spark

ENV PYTHONHASHSEED 0
ENV PYTHONIOENCODING UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

ENV JUPYTER_LAB jupyter-lab --allow-root --ip=0.0.0.0

USER root

RUN apt-get update \
  && apt-get install -y bzip2 gfortran libatlas-base-dev gfortran pkg-config libfreetype6-dev libxft-dev libpng-dev libhdf5-serial-dev g++ make patch lib32ncurses5-dev git \
  && rm -rf /var/lib/apt/lists/* \
  && curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o anaconda.sh \
  && chmod a+x anaconda.sh \
  && ./anaconda.sh -b -p $CONDA_DIR \
  && rm ./anaconda.sh \
  && $CONDA_DIR/bin/conda install python==3.6.6 \
  && $CONDA_DIR/bin/conda upgrade -y conda anaconda --a \
  && $CONDA_DIR/bin/conda install -y jupyterlab \
  && $CONDA_DIR/bin/conda install -y -c conda-forge python-hdfs \
  && $CONDA_DIR/bin/conda clean -y --a \
  && cd /opt \
  && git clone --recursive https://github.com/dmlc/xgboost \
  && cd xgboost \
  && make -j4

ENV PYTHONPATH /opt/xgboost/python-package
ENV PYTHONPATH $SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/:$PYTHONPATH

ENV PYSPARK_PYTHON $CONDA_DIR/bin/python3

RUN mkdir -p /root/.jupyter
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
RUN chmod a+x /root/.jupyter/jupyter_notebook_config.py
