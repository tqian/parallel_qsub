
# Example of submitting parallel jobs using qsub to the cluster "jhpce"

Website for the cluster: https://jhpce.jhu.edu/

1. Modify the directories inside myjobs.R and myjobs.sh to your corresponding project directory on the cluster. I'm using "project directory" as a generic directory.

2. Copy the 3 files (myjobs.R, myjobs.sh, parallel_seeds.csv) to the project directory.

3. Create a new subfolder called Rout (to store the auto-generated log files, which you can refer to if the code has some bug)

4. In terminal, `cd` to your project directory, and type:

```shell
qsub -t 1:100 myjobs.sh
```
Here, 1:100 means you want to submit 100 jobs. myjobs.sh is the shell script that "asks" cluster to run the corresponding R code. You can open the shell script and see there are two parts in a single line: the first part is telling the cluster what R code to run; the second part is telling the cluster where to store the Rout log file. After the job is done, you can open the Rout log files using any text editor.