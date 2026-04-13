import Foundation

@MainActor
final class AddItemViewModel: ObservableObject {
    @Published var name = ""
    @Published var color = ""
    @Published var category: WardrobeCategory = .tops

    func save() {
        // Placeholder for persistence once a real data store is wired in.
    }
}
