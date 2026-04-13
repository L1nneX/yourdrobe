import Foundation

struct Outfit: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var occasion: String
    var notes: String
    var itemNames: [String]
}

extension Outfit {
    static let sampleOutfits: [Outfit] = [
        Outfit(
            id: UUID(),
            name: "City Weekend",
            occasion: "Casual day out",
            notes: "Balanced tones with clean layers for an easy but polished look.",
            itemNames: ["White Oxford Shirt", "Pleated Trousers", "Leather Sneakers"]
        ),
        Outfit(
            id: UUID(),
            name: "Dinner Layer",
            occasion: "Evening smart casual",
            notes: "Add texture through outerwear and keep the palette warm.",
            itemNames: ["Fine Knit", "Suede Jacket", "Dark Trousers"]
        )
    ]
}
