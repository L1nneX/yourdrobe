import Foundation

struct AuthService {
    func signInDemoUser(styleProfile: [String] = ["Minimal", "Streetwear", "Smart casual"]) throws -> User {
        User(
            id: UUID(),
            name: "Alex",
            email: "alex@yourdrobe.app",
            styleProfile: styleProfile
        )
    }
}
