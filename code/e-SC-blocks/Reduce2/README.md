# Ophidia Reduce2 block

It performs a reduction operation based on hierarchy on a datacube.


## Properties
  -  `Cube Name` : name of the input datacube. The name must be in DOI format.
  -  `Schedule` : scheduling algorithm. The only possible value is 0, for a static linear block distribution of resources.
  -  `Dimension` : name of dimension on which the operation will be applied.
  -  `Concept Level` : concept level inside the hierarchy used for the operation.
  -  `Midnight` : if `00` then the edge point of two consecutive aggregate time sets will be aggregated into the right set; if `24` (default) then the edge point will be aggregated into the left set.
  -  `Reduction Operation` : reduction operation. Possible values are `max`, `min`, `avg` and `sum`.
  -  `Grid` : optional argument used to identify the grid of dimensions to be used (if the grid already exists) or the one to be created (if the grid has a new name). If it isn’t specified, no grid will be used.

## Connection Properties
  -  `User Name` : 
  -  `User Password` : 
  -  `Server Address` : 
  -  `Server Port` : 

## System Properties
  -  `Core No.` : number of parallel processes to be used (min. `1`).
  -  `Session Id` : session identifier used server-side to manage sessions and jobs. Usually users don’t need to use/modify it, except when it is necessary to create a new session or switch to another one.
  -  `Object Key Filter` : filter on the output of the operator written to file (default = `all` => no filter, `none` => no output). 


## Inputs
  -  `properties` : an optional input properties for the block.


## Outputs
  -  `properties` : selected output properties such as connection details and output `Cube Name`.
