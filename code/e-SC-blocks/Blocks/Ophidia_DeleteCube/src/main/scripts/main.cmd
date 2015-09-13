@ECHO OFF

:: This is an example command-line script that implements an e-Science Central
:: workflow block.
::
:: Input, outputs and properties of the block are available under environment
:: variables named 'PROPS__<PROPERTY_NAME>', 'INPUTS__<INPUT_NAME>',
:: 'OUTPUTS__<OUTPUT_NAME>'.
::
:: Inputs of type:
::  -- data-wrapper (data tables) are passed as CSV files. The full path to the
::     input file is stored in variable %INPUTS_<INPUT_NAME>%
::  -- file-wrapper (file lists) are passed as-is and you can refer to them
::     using:
::      -- %INPUTS__<INPUT_NAME>% -- the first file on the list (for 
::         convenience)
::      -- %INPUTS__<INPUT_NAME>_LIST[NNN]% -- a simulated array variable with
::         all files from the list (cmd does not allow real arrays to be
::         defined, see examples below)
::  -- other input types are not currently supported; please contact us if you
::     need any.
::
:: Outputs of type:
::  -- data-wrapper need to be CSV files with a header line. The full path of 
::     the output file is indicated in %OUTPUTS__<OUTPUT_NAME>%
::  -- file-wrapper need to be a file which includes a list of files to return.
::     The output file path is indicated by the %OUTPUTS__<OUTPUT_NAME>%
::     variable and each row in this file must include path to the file on the
::     list (see examples below)
::
:: Properties may be of type: String, Integer, Long, Double, Boolean. String 
:: list are currently not supported; please contact us if you need them.
::

:: This command will allow you to see the environment variables set by the
:: system. See below for more examples

SET

::
:: Example 1: List contents of the input file passed through the 'MyInput' block
:: input (data-wrapper or the first file on the file-wrapper list).
::
:: type "%INPUTS__MyInput%"

::
:: Example 2: Search input files (file-wrapper) for a user-provided pattern.
::
:: for /L %%i in ${INPUTS__MyInput__LIST[@]} ; do
::     grep "$PROPS__MyPattern" "$f"
:: done

::
:: Example 3:  Output contents of the root directory through a
:: file-wrapper output
::
:: FOR /F %%f IN ('dir /B') DO (
::     echo %%f >> "%OUTPUTS__MyOutput%"
:: )

:: Sometimes it happens that you need to create a temporary file name that does
:: not clash with any other name in the current directory. You may use this
:: simple function to get such a name.
::
:: call :MKTEMP
:: echo "My new file name is %_result%"
::

GOTO :eof

:MKTEMP
SETLOCAL
SET /a OUTFILE=%RANDOM%+100000
SET OUTFILE=output-%OUTFILE:~5%
IF EXIST %OUTFILE% GOTO MKTEMP
ENDLOCAL & SET _result=%OUTFILE%
GOTO :eof
