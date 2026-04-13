import Foundation

enum WardrobeCategory: String, CaseIterable, Codable {
    case tops = "Tops"
    case bottoms = "Bottoms"
    case outerwear = "Outerwear"
    case footwear = "Footwear"
    case accessories = "Accessories"

    var iconName: String {
        switch self {
        case .tops:
            "tshirt"
        case .bottoms:
            "figure.walk"
        case .outerwear:
            "jacket"
        case .footwear:
            "shoe.2"
        case .accessories:
            "bag"
        }
    }
}

struct WardrobeItem: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var category: WardrobeCategory
    var color: String
    var season: String
}

extension WardrobeItem {
    static let sampleItems: [WardrobeItem] = [
        WardrobeItem(id: UUID(), name: "White Oxford Shirt", category: .tops, color: "White", season: "All season"),
        WardrobeItem(id: UUID(), name: "Pleated Trousers", category: .bottoms, color: "Stone", season: "Spring"),
        WardrobeItem(id: UUID(), name: "Suede Jacket", category: .outerwear, color: "Tan", season: "Autumn"),
        WardrobeItem(id: UUID(), name: "Leather Sneakers", category: .footwear, color: "White", season: "All season")
    ]
}
