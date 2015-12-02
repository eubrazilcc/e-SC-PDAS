# Ophidia Aggregate block

It executes an aggregation function on a datacube with respect to explicit dimensions.


## Properties
  -  `Cube Name` : Name of the input datacube. The name must be in DOI format.
  -  `Schedule` : Scheduling algorithm. The only possible value is `0`, for a static linear block distribution of resources.
  -  `Group Size` : Number of tuples per group to consider in the aggregation function. If set to `all` the aggregation will occur on all tuples of the table.
  -  `Operation` : Aggregate function among `max`, `min`, `avg`, or `sum`.
  -  `Grid`: optional argument used to identify the grid of dimensions to be used (if the grid already exists) or the one to be created (if the grid has a new name). If it isn’t specified, no grid will be used.

## Connection Properties
  -  `User Name` : 
  -  `User Password` : 
  -  `Server Address` : 
  -  `Server Port` : 

## System Properties
  -  `Core No.` : number of parallel processes to be used (min. `1`).
  -  `Session Id` : session identifier used server-side to manage sessions and jobs. Usually users don’t need to use/modify it, except when it is necessary to create a new session or switch to another one.
  -  `Object Key Filter` : filter on the output of the operator written to file (default = `all` => no filter, `none` => no output, `aggregate` =>  show operator’s output DOI as text). 


## Inputs
  -  `properties` : an optional input properties for the block.


## Outputs
  -  `properties` : selected output properties such as connection details and output `Cube Name`.
