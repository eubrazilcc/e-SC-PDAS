# Ophidia Merge block

It creates a new datacube grouping nmerge input fragments in a new output
fragment. If the number of fragments of the input datacube is not a multiple of
nmerge then there will be some output fragments grouping a number of fragments
lower than nmerge. In addition, the number of tuples in each output fragment is
generally different.


## Properties
  -  `Cube Name` : Name of the input datacube. The name must be in DOI format.
  -  `Schedule` : Scheduling algorithm. The only possible value is `0`, for a static linear block distribution of resources.
  -  `Fragment No.` : Number of input fragments to merge in an output fragment. In order to merge all fragments it can be used the default value `0`.

## Connection Properties
  -  `User Name` : 
  -  `User Password` : 
  -  `Server Address` : 
  -  `Server Port` : 

## System Properties
  -  `Core No.` : number of parallel processes to be used (min. `1`).
  -  `Session Id` : session identifier used server-side to manage sessions and jobs. Usually users don’t need to use/modify it, except when it is necessary to create a new session or switch to another one.
  -  `Object Key Filter` : filter on the output of the operator written to file (default = `all` => no filter, `none` => no output, `merge` =>  show operator’s output DOI as text). 


## Inputs
  -  `properties` : an optional input properties for the block.


## Outputs
  -  `properties` : selected output properties such as connection details and output `Cube Name`.
