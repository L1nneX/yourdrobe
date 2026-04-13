import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var itemCount = 18
    @Published var highlightText = "Layer your cream overshirt with tailored trousers and white trainers."
}
