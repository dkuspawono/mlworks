@echo off
rem
rem NT version of the unix script hdiff
rem
rem $Log: hdiff.bat,v $
rem Revision 1.1  1997/04/09 09:43:36  jont
rem new unit
rem Wrapper to the unix version of the script
rem
rem
rem Copyright (C) Harlequin 1997
rem
rem Deal with switches
rem
rem collect the arguments
rem if DOS wasn't so poor we wouldn't have to do this
set MYARGS= 
:startmyargs
if "%1"=="" goto endmyargs
set MYARGS=%MYARGS% %1
shift
goto startmyargs
:endmyargs
sh hdiff %MYARGS%