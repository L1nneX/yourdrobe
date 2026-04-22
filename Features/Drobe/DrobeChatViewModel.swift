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
        messages.append(ChatMessage(text: response(for: trimmed), isFromAssistant: true))
        draft = ""
    }

    func runQuickAction(_ action: String) {
        messages.append(ChatMessage(text: action, isFromAssistant: false))
        messages.append(ChatMessage(text: response(for: action), isFromAssistant: true))
    }

    private func response(for input: String) -> String {
        let lowered = input.lowercased()

        if lowered.contains("match an item") {
            return "Start with one anchor piece, then build around it with calmer supporting colours and textures. A white shirt, relaxed trousers, and clean trainers is a reliable smart-casual base."
        }

        if lowered.contains("what should i wear today") || lowered.contains("wear today") || lowered.contains("outfit") {
            return "For an easy everyday look, try one clean top layer, one structured bottom, and simple footwear. If you want it sharper, keep the colours tonal and add one textured outer layer."
        }

        if lowered.contains("color pairing") || lowered.contains("colour pairing") || lowered.contains("color") || lowered.contains("colour") || lowered.contains("pair") {
            return "A strong starting point is to pair neutrals like white, navy, stone, olive, grey, and black. If you want contrast, let one colour lead and keep the rest restrained."
        }

        if lowered.contains("weather") || lowered.contains("rain") || lowered.contains("cold") || lowered.contains("hot") {
            return "For cooler or unsettled weather, add a practical outer layer and keep your base outfit clean and adaptable. Light layering works better than one heavy piece when the day may shift."
        }

        if lowered.contains("season") || lowered.contains("autumn") || lowered.contains("winter") || lowered.contains("spring") || lowered.contains("summer") {
            return "Seasonal dressing works best when you adjust fabric, layering, and colour depth together. Colder seasons suit texture and layering, while warmer seasons benefit from lighter fabrics and cleaner silhouettes."
        }

        return "That could work well with balanced proportions, a clean silhouette, and a restrained colour palette. If you want, ask me for a colour pairing, an outfit idea, or help dressing for the weather."
    }
}
