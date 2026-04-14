import SwiftUI

struct StyleProfileView: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var authViewModel: AuthViewModel

    let selectedStyles: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Your style profile")
                .font(AppTypography.largeTitle)

            AppCard {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Current direction")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.textSecondary)

                    Text(selectedStyles.isEmpty ? "Still exploring" : selectedStyles.joined(separator: ", "))
                        .font(AppTypography.headline)
                }
            }

            Text("You can fine-tune this later from your profile as your wardrobe grows.")
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)

            Spacer()

            Button("Start using yourdrobe") {
authViewModel.signInDemoUser(styleProfile: selectedStyles.isEmpty ? ["Still exploring"] : selectedStyles)
                router.completeOnboarding()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(24)
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        StyleProfileView(selectedStyles: ["Minimal", "Classic"])
            .environmentObject(AppRouter())
            .environmentObject(AuthViewModel())
    }
}