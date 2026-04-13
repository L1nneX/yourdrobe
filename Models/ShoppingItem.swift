import Foundation

struct ShoppingItem: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var brand: String
    var price: Double
    var description: String

    var priceText: String {
        String(format: "GBP %.2f", price)
    }
}

extension ShoppingItem {
    static let sampleItems: [ShoppingItem] = [
        ShoppingItem(id: UUID(), name: "Textured Overshirt", brand: "Northline", price: 79.0, description: "A lightweight layer that sharpens simple outfits."),
        ShoppingItem(id: UUID(), name: "Relaxed Chinos", brand: "Atelier East", price: 65.0, description: "An easy everyday trouser with room and structure."),
        ShoppingItem(id: UUID(), name: "Minimal Leather Belt", brand: "Oak Studio", price: 35.0, description: "A clean accessory to finish tonal looks.")
    ]
}
