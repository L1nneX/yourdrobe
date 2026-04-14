import Foundation

@MainActor
final class WardrobeViewModel: ObservableObject {
    @Published var items: [WardrobeItem] = [] {
        didSet {
            saveItems()
        }
    }

    private let storageKey = "wardrobe_items"

    init() {
        loadItems()
    }

    func addItem(name: String, color: String, category: WardrobeCategory, itemDescription: String) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedColor = color.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedDescription = itemDescription.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedName.isEmpty, !trimmedColor.isEmpty else { return }

        let newItem = WardrobeItem(
            id: UUID(),
            name: trimmedName,
            category: category,
            color: trimmedColor,
            season: "All season",
            itemDescription: trimmedDescription.isEmpty ? "No description added yet." : trimmedDescription
        )

        items.append(newItem)
    }

    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            items = WardrobeItem.sampleItems
            return
        }

        do {
            items = try JSONDecoder().decode([WardrobeItem].self, from: data)
        } catch {
            items = WardrobeItem.sampleItems
        }
    }

    private func saveItems() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print("Failed to save wardrobe items: \(error)")
        }
    }
}
