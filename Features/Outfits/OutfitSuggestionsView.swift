import SwiftUI

struct OutfitSuggestionsView: View {
    @StateObject private var viewModel = OutfitsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(viewModel.outfits) { outfit in
                    NavigationLink {
                        OutfitDetailView(outfit: outfit)
                    } label: {
                        AppCard {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(outfit.name)
                                    .font(AppTypography.headline)
                                    .foregroundStyle(AppColors.textPrimary)
                                Text(outfit.occasion)
                                    .font(AppTypography.caption)
                                    .foregroundStyle(AppColors.textSecondary)
                                Text(outfit.notes)
                                    .font(AppTypography.body)
                                    .foregroundStyle(AppColors.textSecondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Outfits")
    }
}

#Preview {
    NavigationStack {
        OutfitSuggestionsView()
    }
}
