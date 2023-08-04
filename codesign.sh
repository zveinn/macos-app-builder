codesign --deep --force --options=runtime --sign "Developer ID Application: Tunnels EHF (K824A68KH8)" --timestamp $2

codesign --deep --force --options=runtime --sign $1 --timestamp ./YourApp.app/Contents/MacOS/launcher
codesign --deep --force --options=runtime --sign $1 --timestamp ./YourApp.app/Contents/MacOS/appliction
codesign -dv --verbose=4 ./YourApp.app/Contents/MacOS/appliction
codesign -dv --verbose=4 ./YourApp.app/Contents/MacOS/lancher
