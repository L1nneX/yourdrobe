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

                        Text("\(selectedStyles.count) style\(selectedStyles.count == 1 ? "" : "s") selected")
                            .font(AppTypography.caption)
                            .foregroundStyle(AppColors.textSecondary)

                        FlexibleTagList(items: styles, selection: $selectedStyles)
                    }
                }

                NavigationLink {
                    StyleProfileView(selectedStyles: Array(selectedStyles))
                } label: {
                    Text(selectedStyles.isEmpty ? "Select a style to continue" : "Continue")
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(selectedStyles.isEmpty)
                .opacity(selectedStyles.isEmpty ? 0.6 : 1)
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
