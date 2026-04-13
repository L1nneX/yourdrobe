import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject private var authViewModel: AuthViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AppCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.user.name)
                            .font(AppTypography.title)
                        Text(viewModel.user.email)
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }

                AppCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Style profile")
                            .font(AppTypography.headline)
                        Text(viewModel.user.styleProfile.joined(separator: ", "))
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }

                Button("Sign Out") {
                    authViewModel.signOut()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
