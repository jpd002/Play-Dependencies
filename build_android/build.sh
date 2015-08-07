#!/bin/bash
set -e
$ANDROID_SDK_ROOT/tools/android update project -p ../appcompat
$ANT_HOME/bin/ant
