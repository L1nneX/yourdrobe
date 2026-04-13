# yourdrobe

`yourdrobe` is a SwiftUI iOS app scaffold for wardrobe management, outfit suggestions, product discovery, and AI-assisted style chat.

## What's in this repo

- A SwiftUI app shell with splash, onboarding, and tab-based navigation
- Feature folders for Home, Wardrobe, Outfits, Shop, Drobe, and Profile
- Starter models, services, and view models
- An Xcode project at `yourdrobe.xcodeproj`

## Project structure

```text
App/
Core/
Features/
Models/
Resources/
Services/
Utilities/
yourdrobe.xcodeproj/
```

## Opening the project on a Mac later

1. Install Xcode from the Mac App Store.
2. Clone this repository onto the Mac.
3. Open `yourdrobe.xcodeproj` in Xcode.
4. Select the `yourdrobe` target.
5. In Signing & Capabilities, choose your Apple team.
6. If needed, change the bundle identifier to something unique.
7. Pick an iPhone simulator and run the app.

## Current state

This project was scaffolded outside Xcode, so the code and project structure are ready, but the app still needs to be opened on macOS for real build validation, signing, and simulator/device testing.

## Suggested next development steps

- Replace sample data with real persistence
- Wire `SupabaseService` into auth and data fetching
- Add image picking and item photo processing
- Improve the asset catalog with real app icons and launch assets

## GitHub checklist

- Keep secrets out of the repo
- Commit the source files, resources, and `.xcodeproj`
- Do not commit `DerivedData` or personal Xcode user settings
