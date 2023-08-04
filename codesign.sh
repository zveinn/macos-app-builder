#!/bin/bash

codesign --deep --force --options=runtime --sign "$1" --timestamp ./YourApp.app/Contents/MacOS/launcher
codesign -dv --verbose=4 ./YourApp.app/Contents/MacOS/launcher

codesign --deep --force --options=runtime --sign "$1" --timestamp ./YourApp.app/Contents/MacOS/application
codesign -dv --verbose=4 ./YourApp.app/Contents/MacOS/application
