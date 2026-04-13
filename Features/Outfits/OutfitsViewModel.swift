import Foundation

@MainActor
final class OutfitsViewModel: ObservableObject {
    @Published var outfits: [Outfit] = Outfit.sampleOutfits
}
