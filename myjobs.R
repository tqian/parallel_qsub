# set working directory
setwd("~/project_folder")

version_fut <- as.integer(Sys.getenv("SGE_TASK_ID"))
# This number is created when you submit parallel jobs onto cluster
# For example: if you submit $ qsub -t 1:100 myjobs.sh, then the i-th job will have version_fut = i.

# set random seeds
# you can simply do something like set.seed(version_fut),
# but it seems the following way is more "random".
# "parallel_seeds.csv" was generated using another R code, which I'm attaching.

parallel_seeds <- data.matrix(read.csv("parallel_seeds.csv"))
.Random.seed <- parallel_seeds[version_fut, ]

parameters <- 1:100
param_this_job <- parameters[version_fut]


# In the following: run the function and save the result to a file (filename includes version_fut to distinguish)
result <- rnorm(100, mean = param_this_job)

dir.create(paste0("result/"), showWarnings = FALSE) # create a directory if it doesn't exists
save(result, file = paste0("result/myresult_", version_fut, ".rda") )