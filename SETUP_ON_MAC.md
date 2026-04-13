# Setup On Mac

Use these steps when you finally have access to a Mac.

## 1. Install the tools

- Install Xcode from the Mac App Store
- Install Git if it is not already available

## 2. Get the project

- Clone the GitHub repository
- Or download the ZIP and unzip it

## 3. Open the app

- Open `yourdrobe.xcodeproj`
- Wait for Xcode to finish indexing

## 4. Fix signing

- Click the blue project icon in the navigator
- Select the `yourdrobe` target
- Open `Signing & Capabilities`
- Choose your Apple team
- Change the bundle identifier if Xcode says it is not unique

## 5. Run it

- Choose an iPhone simulator like `iPhone 16`
- Press the Run button

## 6. If Xcode shows issues

- Let Xcode update project settings if prompted
- Recheck signing if the app will not install
- Add actual app icon images later if you want to archive or ship
