import Foundation

@MainActor
final class WardrobeViewModel: ObservableObject {
    @Published var items: [WardrobeItem] = WardrobeItem.sampleItems
}
