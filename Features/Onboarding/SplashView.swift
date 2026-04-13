import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.background, AppColors.surface],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "hanger")
                    .font(.system(size: 56, weight: .light))
                    .foregroundStyle(AppColors.accent)

                Text("yourdrobe")
                    .font(AppTypography.largeTitle)
                    .foregroundStyle(AppColors.textPrimary)

                Text("Style your wardrobe with clarity.")
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textSecondary)
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(1.2))
            router.showOnboarding()
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(AppRouter())
}
