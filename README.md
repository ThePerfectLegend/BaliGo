# BaliGo!

SwiftUI Travel Guide app uses MVVM Architecture, MapKit, CoreLocation. BaliGo provides information about landmarks with photo, description, visiting advice and location. User can buy tickets to near island and order excurcion. All content in the app is my experience of travaling, some photos was downloaded from stocks. In total preparing content, design and development took 8 month from creating scratch to publish on the App Store.

<a href="https://apps.apple.com/app/bali-go/id1580667720"><img alt="Custom badge" src="https://user-images.githubusercontent.com/94032706/170984756-d1ed69fb-2ff6-49fd-8e62-54a71c86e1ff.png"></a>

![GitHubBaliGo_1](https://user-images.githubusercontent.com/94032706/170975392-15904ebd-1d74-4671-8681-82b76c955d3a.png)
![GitHubBaliGo_2](https://user-images.githubusercontent.com/94032706/170975412-8e1a2559-77b8-4fda-a659-d3c12cc790c2.png)
![GitHubBaliGo_3](https://user-images.githubusercontent.com/94032706/170975429-d48ca57d-2ea6-4be6-9edd-447a38fca5f4.png)

## Technologies & Functionality

- Project uses MVVM Architecture.
- The map is implemented on the `MapKitv` with `UIViewRepresentable` wrapper for integrate view into SwiftUI hierarchy.
- User location getting by `CoreLoaction` and calculating distance to each landmark.
- User can add landmarks and activities in favorites. Data saves in `UserDefaults`.
- Information about user preferences is getting from `Locale`.
- In Settings user can change the route app, map type and currency. Data saves in `UserDefaults`.
- The app implemented custom and reusable NavigationBar buttons.
- Launch screen is combined with `UIKit` and `SwiftUI` loading animation. Added app icon.

## Road Map

- Refactoring (part of the code base is not satisfying production quality code)
- English localization
- Change activity provider and start to use API requests to get info
- Gamification and connection to the Game Center
- In app purchase
