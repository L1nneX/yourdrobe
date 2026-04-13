import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var user = User(
        id: UUID(),
        name: "Alex Rivera",
        email: "alex@yourdrobe.app",
        styleProfile: ["Minimal", "Smart casual"]
    )
}
