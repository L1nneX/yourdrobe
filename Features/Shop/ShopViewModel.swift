import Foundation

@MainActor
final class ShopViewModel: ObservableObject {
    @Published var products: [ShoppingItem] = ShoppingItem.sampleItems
}
