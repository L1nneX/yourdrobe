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
    @Published var pendingDrobePrompt: String?

    func showOnboarding() {
        flow = .onboarding
        selectedTab = .home
    }

    func completeOnboarding() {
        flow = .main
        selectedTab = .home
    }

    func signOut() {
        flow = .onboarding
        selectedTab = .home
        pendingDrobePrompt = nil
    }

    func openDrobe(with prompt: String) {
        pendingDrobePrompt = prompt
        selectedTab = .drobe
    }
}
