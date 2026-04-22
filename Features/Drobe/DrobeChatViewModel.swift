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

        if lowered.contains("dress for the weather") {
            return "Tell me the weather mood you are dressing for, like rainy, cold, sunny, or windy, and I’ll help shape the outfit around it."
        }

        if lowered.contains("rainy") || lowered.contains("rain") {
            return "For a rainy day, keep the outfit practical and layered. A light jacket, full-length trousers, and sturdier footwear will help, while darker or more muted tones usually feel more grounded."
        }

        if lowered.contains("cold") {
            return "For a cold day, build from a warm base and add texture through layering. Knitwear, heavier trousers, and a structured outer layer will keep the look sharp without feeling bulky."
        }

        if lowered.contains("mild") {
            return "For mild weather, aim for balance. A breathable top, relaxed trousers, and one optional light layer gives you flexibility without overcomplicating the outfit."
        }

        if lowered.contains("warm") {
            return "For warm weather, keep fabrics lighter and the silhouette clean. Soft neutrals, easy separates, and minimal layering usually work best."
        }

        if lowered.contains("snowing") || lowered.contains("snow") {
            return "For snowy weather, prioritise warmth, traction, and cleaner heavier layers. A coat, knit base, and more protective footwear will make the outfit feel intentional as well as practical."
        }

        if lowered.contains("sunny") {
            return "For a sunny day, keep the outfit lighter in both colour and weight. Crisp basics, breathable fabrics, and cleaner shapes tend to feel freshest."
        }

        if lowered.contains("windy") {
            return "For windy weather, use pieces with a bit more structure so the outfit still feels composed. A secure outer layer and streamlined silhouette will work better than anything too loose or flimsy."
        }

        if lowered.contains("boiling hot") || lowered.contains("very hot") || lowered.contains("hot") {
            return "For a boiling hot day, strip the outfit back to the essentials. Go for breathable fabrics, easy movement, and as little layering as possible while keeping the palette clean."
        }

        if lowered.contains("season") || lowered.contains("autumn") || lowered.contains("winter") || lowered.contains("spring") || lowered.contains("summer") {
            return "Seasonal dressing works best when you adjust fabric, layering, and colour depth together. Colder seasons suit texture and layering, while warmer seasons benefit from lighter fabrics and cleaner silhouettes."
        }

        return "That could work well with balanced proportions, a clean silhouette, and a restrained colour palette. If you want, ask me for a colour pairing, an outfit idea, or help dressing for the weather."
    }
}
