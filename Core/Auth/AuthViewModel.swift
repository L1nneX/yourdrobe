import Foundation

@MainActor
final class AuthViewModel: ObservableObject {
    @Published private(set) var currentUser: User?
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let authService: AuthService

    init(authService: AuthService = AuthService()) {
        self.authService = authService
    }

    var isAuthenticated: Bool {
        currentUser != nil
    }

    func signInDemoUser(styleProfile: [String] = ["Minimal", "Streetwear", "Smart casual"]) {
        isLoading = true
        errorMessage = nil

        do {
            currentUser = try authService.signInDemoUser(styleProfile: styleProfile)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func signOut() {
        currentUser = nil
    }
}
