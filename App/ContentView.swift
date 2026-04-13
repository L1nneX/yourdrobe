import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        Group {
            switch router.flow {
            case .splash:
                SplashView()
            case .onboarding:
                NavigationStack {
                    OnboardingView()
                }
            case .main:
                MainTabView()
            }
        }
        .preferredColorScheme(.light)
    }
}

private struct MainTabView: View {
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        TabView(selection: $router.selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(AppTab.home)

            NavigationStack {
                WardrobeGridView()
            }
            .tabItem {
                Label("Wardrobe", systemImage: "square.grid.2x2")
            }
            .tag(AppTab.wardrobe)

            NavigationStack {
                OutfitSuggestionsView()
            }
            .tabItem {
                Label("Outfits", systemImage: "sparkles")
            }
            .tag(AppTab.outfits)

            NavigationStack {
                ShopFeedView()
            }
            .tabItem {
                Label("Shop", systemImage: "bag")
            }
            .tag(AppTab.shop)

            NavigationStack {
                DrobeChatView()
            }
            .tabItem {
                Label("Drobe", systemImage: "message")
            }
            .tag(AppTab.drobe)

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(AppTab.profile)
        }
        .tint(AppColors.accent)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppRouter())
        .environmentObject(AuthViewModel())
}
