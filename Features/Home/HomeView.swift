import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Today")
                    .font(AppTypography.largeTitle)

                AppCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Wardrobe summary")
                            .font(AppTypography.headline)
                        Text("\(viewModel.itemCount) items ready to style")
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }

                AppCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Suggested look")
                            .font(AppTypography.headline)
                        Text(viewModel.highlightText)
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }
            }
            .padding(24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
