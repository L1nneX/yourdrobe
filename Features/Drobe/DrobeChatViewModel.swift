import Foundation

@MainActor
final class DrobeChatViewModel: ObservableObject {
    @Published var draft = ""
    @Published var messages: [ChatMessage] = [
        ChatMessage(text: "Show me something smart casual for a cool evening.", isFromAssistant: false),
        ChatMessage(text: "Try a knit polo, relaxed trousers, and a lightweight overshirt.", isFromAssistant: true)
    ]

    func sendMessage() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        messages.append(ChatMessage(text: trimmed, isFromAssistant: false))
        messages.append(ChatMessage(text: "That could work well with neutral layers and a clean silhouette.", isFromAssistant: true))
        draft = ""
    }
}
