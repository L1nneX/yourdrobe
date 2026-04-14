import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var router: AppRouter
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let user = authViewModel.currentUser {
                    AppCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.name)
                                .font(AppTypography.title)
                            Text(user.email)
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.textSecondary)
                        }
                    }

                    AppCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Style profile")
                                .font(AppTypography.headline)
                            Text(user.styleProfile.joined(separator: ", "))
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.textSecondary)
                        }
                    }

Button("Sign Out") {
    authViewModel.signOut()
    router.signOut()
}
                    }
                    .buttonStyle(PrimaryButtonStyle())
                } else {
                    AppCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("No user signed in")
                                .font(AppTypography.title)
                            Text("Complete onboarding to create your style profile.")
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.textSecondary)
                        }
                    }
                }
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
