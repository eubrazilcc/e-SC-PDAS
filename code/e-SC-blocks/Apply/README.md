# Ophidia Apply block

It executes a query on a datacube. The SQL query must contain only the needed
primitive (or nested primitives) without SQL clauses like SELECT or FROM. All
the examples provided in the primitives manual report the SQL query that could
be used when directly connected to the database. In order to properly use them
in the Ophidia analytics framework, the user must extract only the SELECT
filters, between SELECT and FROM. The result of the query execution will be
saved in a new datacube. The type of the resulting measure must be equal to
the input measure one. In case of inequalities, it is necessary to call the
primitive oph_cast in order to save the results with the appropriate type.


## Properties
  -  `Cube Name` : name of the input datacube. The name must be in DOI format.
  -  `Query` : a user-defined SQL query. It may use Ophidia primitives.
  -  `Dimensions Query` : user-defined SQL query to be applied to dimension values. It may use Ophidia primitives. In case the size of original array decreases, by default, values are set as incremental indexes.
  -  `Measure` : name of the new measure resulting from the specified operation.
  -  `Measure Type` : if `auto` measure type will be set automatically to that of input datacube; the related primitive arguments have to be omitted in “query”, if “manual” (default) measure type and the related primitive arguments have to be set in “query”.
  -  `Dimension Type` : if `auto` dimension type will be set automatically to that of input datacube, the related primitive arguments have to be omitted in “dim_query”; if “manual” (default) dimension type and the related primitive arguments have to be set in “dim_query”.
  -  `Check Type` : if set the agreement between input and output data types of nested primitives will be checked, if unset data type will be not checked (valid only for 'manual' setting of `measure_type` and `dim_type`).
  -  `Compressed` : if `auto` (default) new data will be compressed according to compression status of input datacube, if `yes` new data will be compressed, if `no` data will be inserted without compression.
  -  `Schedule` : scheduling algorithm. The only possible value is `0`, for a static linear block distribution of resources.


## Connection Properties
  -  `User Name` : 
  -  `User Password` : 
  -  `Server Address` : 
  -  `Server Port` : 

## System Properties
  -  `Core No.` : number of parallel processes to be used (min. `1`).
  -  `Session Id` : session identifier used server-side to manage sessions and jobs. Usually users don’t need to use/modify it, except when it is necessary to create a new session or switch to another one.
  -  `Object Key Filter` : filter on the output of the operator written to file (default = `all` => no filter, `none` => no output, `apply` =>  show operator’s output DOI as text).


## Inputs
  -  `properties` : an optional input properties for the block.


## Outputs
  -  `properties` : selected output properties such as connection details and output `Cube Name`.
