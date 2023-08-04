# MacOS .APP Builder template + Scripts

# Folder structure
- icon: Icon generation script + icon assets
- YourApp.app: the application and it's content
- YourApp.app/Contents/MacOS: this is where your executable binaries is places along with the launcher
- YourApp.app/Contents/Resources: this is where additional resources are place, f.x. the icon set.
- YourApp.app/Contents: this is considered the root folder for your application. The info.plist is located here
- application: a dummy application used for the showcase

# Generating icons
To generate icons use the "generate-iconset.sh" script
 - the icon generator requires sips and iconutil to be installed. 
 - We recommend a high resolution icon as the base icon (1024x1024) should be sufficient.
 - Replace the "icons/icon.png" file with your custom icon 
```bash
$ ./icons/generate-icons.sh
```
The script will generate icons inside the "/icon/icons.iconset" folder, then turn those icons into an .icns collection and then move the .icns collection into your .app 

# The .plist file
There are a few variables that you need to change in the .plist file
- DO NOT CHANGE THE CFBundleExecutable name
```
_{APP_NAME}_
_{COMPANY}_
_{VERSION}_
_{COPYRIGHTS}_
```

# Where to put your Application ?
Place your executable/binary inside "YourApp.app/Contents/MacOS" under the name "application". The launcher will automatically launch any executable name "application" inside the MacOS directory.

# Code Signing and Notarizing
To properly code sign and notarize your app, follow these steps in order from top to bottom:
 - Run the codesign tool
 ```bash
 $./codesign.sh [YOUR_DEVELOPER_ID]
 # Example: ./codesigh.sh "Developer ID Application: Tunnels EHF (K824A68KH8)"
 ```
 - Create a .zip folder from the YourApp.app folder
 - Run the notarize tool
 ```bash
 $ ./notarize.sh [APPLE_ID] [TEAM_ID] [APP_SPECIFIC_PASSWORD]
 #Example: ./notarize.sh your@email.com K824A68KH8 sdfs-sdsd-sdfs-ssdf
 ```
 - Once apple finishes notarizing your application it will place a CodeSignature inside your .zip.
 - At this point YourApp.app is ready for shipping, just extract it from the .zip
 - NOTE: you probably want to upload the .zip instead of .app, some platforms like google drive can damage the contents of the .app


# The Launcher
You do not need to build the launcher yourself, it is included in the YourApp.app package
## building the launcher
```bash
$ gcc -o launcher launcher.c -framework Security -framework CoreFoundation
```