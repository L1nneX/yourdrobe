import Foundation

struct WardrobeService {
    func fetchItems() async -> [WardrobeItem] {
        WardrobeItem.sampleItems
    }
}
