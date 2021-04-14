{"name":"Ben","age":"23"}
{"name":"Alen","age":"22"}

import org.apache.spark.SparkContext
import org.apache.spark.sql.SparkSession

val spark = SparkSession.builder().getOrCreate()

// val sc = new SparkContext(conf)
val sqlcontext = new org.apache.spark.sql.SQLContext(sc)
val dfs = sqlContext.read.json("Students.json")
dfs.show()

---

"Hi Friends Welcome to Fresco Play the digital learning platform" > fresco.txt
import org.apache.spark.sql.SparkSession
val spark = SparkSession.builder().getOrCreate()

val rdd2 = sc.textFile("fresco.txt")
val rdd = spark.read.text("fresco.txt")

val counts = rdd.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)


// 
import org.apache.spark.sql.SparkSession
val spark = SparkSession.builder().getOr
val broadcastVar = sc.broadcast(Array(1, 2, 3, 4, 5))
val broadcastVar = spark.sparkContext.broadcast(Array(1, 2, 3, 4, 5))

val accum = sc.longAccumulator("Fresco Accumulator")
val rdd = sc.parallelize(Array(1, 2, 3, 4, 5, 6, 7, 8, 9))