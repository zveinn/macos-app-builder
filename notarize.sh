#!/bin/bash
zip -r YourApp.zip YourApp.app -x "*.DS_Store"

xcrun notarytool submit YourApp.zip --apple-id $1 --team-id $2  --password $3 --wait