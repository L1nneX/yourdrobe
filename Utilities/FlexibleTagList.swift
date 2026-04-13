import SwiftUI

struct FlexibleTagList: View {
    let items: [String]
    @Binding var selection: Set<String>

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(chunked(items, size: 2), id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(item) {
                            toggle(item)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(selection.contains(item) ? AppColors.accent : AppColors.background)
                        .foregroundStyle(selection.contains(item) ? Color.white : AppColors.textPrimary)
                        .clipShape(Capsule())
                    }
                    Spacer()
                }
            }
        }
    }

    private func toggle(_ item: String) {
        if selection.contains(item) {
            selection.remove(item)
        } else {
            selection.insert(item)
        }
    }

    private func chunked(_ source: [String], size: Int) -> [[String]] {
        stride(from: 0, to: source.count, by: size).map {
            Array(source[$0 ..< min($0 + size, source.count)])
        }
    }
}
