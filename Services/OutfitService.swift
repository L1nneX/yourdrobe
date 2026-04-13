import Foundation

struct OutfitService {
    func fetchSuggestions() async -> [Outfit] {
        Outfit.sampleOutfits
    }
}
