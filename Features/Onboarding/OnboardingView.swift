import SwiftUI

struct OnboardingView: View {
    @State private var selectedStyles: Set<String> = []

    private let styles = ["Minimal", "Streetwear", "Classic", "Bold", "Relaxed"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Build a wardrobe that works harder.")
                    .font(AppTypography.largeTitle)
                    .foregroundStyle(AppColors.textPrimary)

                Text("Track what you own, plan outfits, and discover smarter additions based on your style.")
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textSecondary)

                AppCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Pick your style direction")
                            .font(AppTypography.headline)

                        FlexibleTagList(items: styles, selection: $selectedStyles)
                    }
                }

                NavigationLink {
                    StyleProfileView(selectedStyles: Array(selectedStyles))
                } label: {
                    Text("Continue")
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        OnboardingView()
    }
}
