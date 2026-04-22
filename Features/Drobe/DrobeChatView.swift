import SwiftUI

struct DrobeChatView: View {
    @StateObject private var viewModel = DrobeChatViewModel()

    private let quickActions = [
        "Match an item",
        "What should I wear today?",
        "Color pairing help",
        "Dress for the weather"
    ]

private let weatherOptions = [
    "Rainy",
    "Cold",
    "Mild",
    "Warm",
    "Snowing",
    "Sunny",
    "Windy",
    "Boiling hot"
]

    var body: some View {
        VStack(spacing: 16) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection
                    quickActionsSection
                    weatherSection
                    messagesSection
                }
                .padding(24)
            }

            composerSection
                .padding(.horizontal)
                .padding(.bottom, 16)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Drobe")
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Drobe")
                .font(AppTypography.largeTitle)
                .foregroundStyle(AppColors.textPrimary)

            Text("Your wardrobe-aware stylist for outfit ideas, color pairings, and everyday dressing help.")
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)
        }
    }

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Start with")
                .font(AppTypography.headline)
                .foregroundStyle(AppColors.textPrimary)

            ForEach(quickActions, id: \.self) { action in
                Button {
                    viewModel.runQuickAction(action)
                } label: {
                    HStack {
                        Text(action)
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textPrimary)

                        Spacer()

                        Image(systemName: "arrow.up.right")
                            .foregroundStyle(AppColors.textSecondary)
                    }
                    .padding()
                    .background(AppColors.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(AppColors.border, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var weatherSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Weather today")
                .font(AppTypography.headline)
                .foregroundStyle(AppColors.textPrimary)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 12)], spacing: 12) {
                ForEach(weatherOptions, id: \.self) { option in
                    Button {
                        viewModel.runQuickAction(option)
                    } label: {
                        Text(option)
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(AppColors.surface)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(AppColors.border, lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var messagesSection: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.messages) { message in
                HStack {
                    if message.isFromAssistant {
                        messageBubble(message.text, background: AppColors.surface, foreground: AppColors.textPrimary)
                        Spacer()
                    } else {
                        Spacer()
                        messageBubble(message.text, background: AppColors.accent, foreground: .white)
                    }
                }
            }
        }
    }

    private var composerSection: some View {
        HStack(spacing: 12) {
            TextField("Ask Drobe for styling help", text: $viewModel.draft)
                .textFieldStyle(.roundedBorder)

            Button("Send") {
                viewModel.sendMessage()
            }
            .buttonStyle(PrimaryButtonStyle())
            .frame(width: 92)
        }
    }

    private func messageBubble(_ text: String, background: Color, foreground: Color) -> some View {
        Text(text)
            .padding(12)
            .foregroundStyle(foreground)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

#Preview {
    NavigationStack {
        DrobeChatView()
    }
}
