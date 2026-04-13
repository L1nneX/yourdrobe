import Foundation

struct ShopService {
    func fetchProducts() async -> [ShoppingItem] {
        ShoppingItem.sampleItems
    }
}
