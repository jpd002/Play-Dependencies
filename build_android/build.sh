#!/bin/bash
set -e
$ANDROID_SDK_ROOT/tools/android update project -p ../appcompat -t android-22
$ANT_HOME/bin/ant
