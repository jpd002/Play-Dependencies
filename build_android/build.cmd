@echo off
CALL %ANDROID_SDK_ROOT%/tools/android.bat update project -p ../appcompat
%ANT_HOME%/bin/ant
