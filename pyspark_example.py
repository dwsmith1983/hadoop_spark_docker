import sys
from random import random
from operator import add

from pyspark import SparkContext, SparkConf

def f(_):
    x = random() * 2 - 1
    y = random() * 2 - 1
    return 1 if x ** 2 + y ** 2 < 1 else 0

if __name__ == "__main__":
    # test with jupyter-lab in spark master container
    conf = SparkConf().setAppName("PySpark App").setMaster("spark://master:7077")
    SparkContext.setSystemProperty('spark.executor.memory', '1g')
    sc = SparkContext(conf=conf)

    # test spark process
    partitions = 10
    n = 100000 * partitions
    count = sc.parallelize(range(1, n + 1), partitions).map(f).reduce(add)
    print("Pi is roughly %f" % (4.0 * count / n))

    # test spark connect hadoop
    text = sc.textFile("hdfs://namenode:9820/user/test.md")
    print(text.collect())

sc.stop()
