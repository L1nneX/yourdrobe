import Foundation

@MainActor
final class ItemDetailViewModel: ObservableObject {
    let item: WardrobeItem

    init(item: WardrobeItem) {
        self.item = item
    }
}
