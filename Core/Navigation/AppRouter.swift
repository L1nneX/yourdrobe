import Foundation

enum AppFlow {
    case splash
    case onboarding
    case main
}

enum AppTab: Hashable {
    case home
    case wardrobe
    case outfits
    case shop
    case drobe
    case profile
}

@MainActor
final class AppRouter: ObservableObject {
    @Published var flow: AppFlow = .splash
    @Published var selectedTab: AppTab = .home

    func showOnboarding() {
        flow = .onboarding
    }

    func completeOnboarding() {
        flow = .main
        selectedTab = .home
    }
}
