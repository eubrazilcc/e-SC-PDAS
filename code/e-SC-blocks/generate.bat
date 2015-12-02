@echo off

mvn archetype:generate ^
    -DinteractiveMode=false ^
    -DarchetypeGroupId=com.connexience ^
    -DarchetypeArtifactId=workflow-block-gnuplot-standalone ^
    -DarchetypeVersion=3.1-SNAPSHOT ^
    -DgroupId=test.eSC.blocks ^
    -DartifactId=GnuPlotTest ^
    -Dversion=1.0
