#!/bin/sh

# build hadoop
cd hadoop
docker build -t ${1:-hadoop} .
docker tag ${1:-hadoop} dwsmith1983/${1:-hadoop}
docker push dwsmith1983/${1:-hadoop}

# build namenode
cd namenode
docker build -t ${2:-namenode} .
docker tag ${2:-namenode} dwsmith1983/${2:-namenode}
docker push dwsmith1983/${2:-namenode}

# build datanode
cd ..//datanode
docker build -t ${3:-datanode} .
docker tag ${3:-datanode} dwsmith1983/${3:-datanode}
docker push dwsmith1983/${3:-datanode}

# build spark
cd ..//..//spark
docker build -t ${4:-spark} .
docker tag ${4:-spark} dwsmith1983/${4:-spark}
docker push dwsmith1983/${4:-spark}

# build python
cd ..//anaconda
docker build -t ${5:-anaconda} .
docker tag ${5:-anaconda} dwsmith1983/${5:-anaconda}
docker push dwsmith1983/${5:-anaconda}

# build datascience addon
cd ..//datascience
docker build -t ${6:-datascience} .
docker tag ${6:-datascience} dwsmith1983/${6:-datascience}
docker push dwsmith1983/${6:-datascience}
