import SwiftUI

@main
struct yourdrobeApp: App {
    @StateObject private var router = AppRouter()
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(authViewModel)
        }
    }
}
