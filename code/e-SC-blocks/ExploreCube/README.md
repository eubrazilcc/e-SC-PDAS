# Ophidia Explore Cube block

It prints the data stored into a datacube, possibly subset along its dimensions. Dimension values are used as input filters for subsetting.


## Properties
  -  `Cube Name` : Name of the input datacube. The name must be in DOI format.
  -  `Schedule` : Scheduling algorithm. The only possible value is `0`, for a static linear block distribution of resources.
  -  `Subset Dimensions` : dimension names of the datacube used for the subsetting. Multiple-value field: list of dimensions separated by “|” can be provided Must be the same number of “subset_filter”
  -  `Subset Filter` : enumeration of comma-separated elementary filters (1 series of filters for each dimension):
     -  value : select a specific value;
     -  start_value:stop_value : select elements from start_value to stop_value; return an error if this set is empty.
     Values should be numbers. Example: `Subset Dimensions=lat|lon` and `Subset Filter=35:45|15:20` Multiple-value field: list of filters separated by “|” can be provided; it must be the same number of `Subset Dimensions`
  -  `Limit Filter` : optional filter on the maximum number of rows.
  -  `Show Id` : if unset (default), it won’t show fragment row ID. Otherwise, it will also show the fragment row ID.
  -  `Show Index` : if unset (default), it won’t show dimension ids. Otherwise, it will also show the dimension id next to the value.
  -  `Show Time` : if unset (default), the values of time dimension are shown as numbers. Otherwise, the values are converted as a string with date and time.
  -  `Level` : if set to `1` (default) only measure values are shown, if set to `2` the dimension values are also returned.

## Connection Properties
  -  `User Name` : 
  -  `User Password` : 
  -  `Server Address` : 
  -  `Server Port` : 

## System Properties
  -  `Core No.` : number of parallel processes to be used (min. `1`).
  -  `Session Id` : session identifier used server-side to manage sessions and jobs. Usually users don’t need to use/modify it, except when it is necessary to create a new session or switch to another one.
  -  `Object Key Filter` : filter on the output of the operator written to file (default = `all` => no filter, `none` => no output, `explorecube_data` => show the content of a cube, `explorecube_summary` => show the number of rows to be extracted, `explorecube_dimvalues` => show the values of the dimensions of output cube).


## Inputs
  -  `properties` : an optional input properties for the block.


## Outputs
  -  `properties` : selected output properties such as connection details and output `Cube Name`.
