# JOS_Unit-nonresponse_and_Inference
Simulation archive for the manuscript `How to obtain valid inference under unit non-response?'


The four folders represent the four methods investigated. 
In each of the folders you can find:

The script: '1.Execute.R'. This file starts with loading the required packages

Then it loads the relevant simulation functions, which can all be found in the 
folder: functions. 

Next, it sets the global simulation parameters, and then it loads a seperate
.R script for every simulation condition, these scripts can all be found in the 
folder "Simulation conditions".

Every condition script starts with setting local parameters. Then it creates a
population  dataset with the "createdata.R" script.

In the simulation function:
For weighting and sample imputation, a sample is drawn from the population dataset.
Next, a part of the data is made missing. For masss imputation and CCA, the
sampling step is skipped and missingness is directly induced. In the next step,
the relevant method is applied, and an outfile is created saving the relevant
output. This process is replicated 1000 times. The outfile containing output of 
the 1000 replications is saved under "Workspaces/Simulation".

With the "Evaluate.R" script, we obtain the relevant output from each .Rdata file
from each simulation condition and save it under "Workspaces/Evaluation".


- Laura, Gerko and Joop
