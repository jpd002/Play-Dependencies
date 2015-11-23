@echo off
CALL %ANDROID_SDK_ROOT%/tools/android.bat update project -p ../appcompat -t android-23
%ANT_HOME%/bin/ant
