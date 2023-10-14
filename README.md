# Assignments

PCA:
reduce the dimensionality of the data
data has large no of attributes and correlation between variables
difficult to identify corr with each variable

in PCA, identify those components/attributes affetcing the outcome at a greater level, comparing all other attributes
reduce the dependencies
try to retain as much variation as possible
transform the variables to a new set of var
this new set is called the principal component

in PCA, when we are analysing the data that encounters problems, i.e. high dimensions, visualise using a technique
dimensionality reduction must be applied -> PCA
imp to deal with large datasets

PCA -> unsupervised approach
LDA -> supervised approach

PCA is a statistical procedure to transform a set of correlated variables to uncorrelated variable
Used for exploratory data analysis (EDA)

while applying PCA, try to preserve the most imp reln between the variables 
without any prior knowledge of the target variable

through PCA, 2D rel -> 1D rel
Step 1: standardize the dataset
ensure every variable has smaller deviation range
mean =0  and std dev =1
to get data in the 

Step 2: covariance matrix 
measue the strength of the joint

Step 3: identify the eigen values and eigen vector from the covariance matrix
these vectors are the principal component values


GMM
#Gaussian mixture model
#it is flexible
#represents the probability distribution
#comes as sum of mutliple weighted gassian diatribution
#GMM will model data as a mixture of several gaussina distributions
#could be a combination / cluster of different gaussian models
#Each of the components represent a cluster

#Gaussian model has a set of its own parameters
#K-means performs hard clustering
#GMM performs soft clustering
