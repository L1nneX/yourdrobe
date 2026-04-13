import Foundation

struct ChatMessage: Identifiable, Codable, Hashable {
    let id: UUID
    var text: String
    var isFromAssistant: Bool

    init(id: UUID = UUID(), text: String, isFromAssistant: Bool) {
        self.id = id
        self.text = text
        self.isFromAssistant = isFromAssistant
    }
}
