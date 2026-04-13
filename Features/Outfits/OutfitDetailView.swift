import SwiftUI

struct OutfitDetailView: View {
    let outfit: Outfit

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(outfit.name)
                .font(AppTypography.largeTitle)

            Text(outfit.notes)
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)

            AppCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pieces")
                        .font(AppTypography.headline)

                    ForEach(outfit.itemNames, id: \.self) { item in
                        Text(item)
                            .font(AppTypography.body)
                    }
                }
            }

            Spacer()
        }
        .padding(24)
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        OutfitDetailView(outfit: Outfit.sampleOutfits[0])
    }
}
