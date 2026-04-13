import Foundation

struct AuthService {
    func signInDemoUser() throws -> User {
        User(
            id: UUID(),
            name: "Alex",
            email: "alex@yourdrobe.app",
            styleProfile: ["Minimal", "Streetwear", "Smart casual"]
        )
    }
}
