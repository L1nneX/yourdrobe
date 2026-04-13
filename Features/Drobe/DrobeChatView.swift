import SwiftUI

struct DrobeChatView: View {
    @StateObject private var viewModel = DrobeChatViewModel()

    var body: some View {
        VStack(spacing: 12) {
            ScrollView {
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
                .padding()
            }

            HStack(spacing: 12) {
                TextField("Ask Drobe for styling help", text: $viewModel.draft)
                    .textFieldStyle(.roundedBorder)

                Button("Send") {
                    viewModel.sendMessage()
                }
                .buttonStyle(PrimaryButtonStyle())
                .frame(width: 92)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Drobe")
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
