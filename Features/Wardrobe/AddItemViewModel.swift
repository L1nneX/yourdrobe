import Foundation

@MainActor
final class AddItemViewModel: ObservableObject {
    @Published var name = ""
    @Published var color = ""
    @Published var category: WardrobeCategory = .tops

    func save(using wardrobeViewModel: WardrobeViewModel) {
        wardrobeViewModel.addItem(name: name, color: color, category: category)
    }
}