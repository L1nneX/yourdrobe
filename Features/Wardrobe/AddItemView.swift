import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var wardrobeViewModel: WardrobeViewModel
    @StateObject private var viewModel = AddItemViewModel()

    var body: some View {
        Form {
            Section("Item details") {
                TextField("Name", text: $viewModel.name)
                TextField("Color", text: $viewModel.color)

                Picker("Category", selection: $viewModel.category) {
                    ForEach(WardrobeCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }

            Section("Description") {
                TextField("Describe the item", text: $viewModel.itemDescription, axis: .vertical)
                    .lineLimit(3...6)
            }

            Section("Photo") {
                VStack(alignment: .leading, spacing: 10) {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.gray.opacity(0.12))
                        .frame(height: 140)
                        .overlay(
                            VStack(spacing: 8) {
                                Image(systemName: "photo")
                                    .font(.system(size: 28))
                                    .foregroundStyle(AppColors.textSecondary)

                                Text("Photo support coming soon")
                                    .font(AppTypography.caption)
                                    .foregroundStyle(AppColors.textSecondary)
                            }
                        )

                    Text("For now, items save without a photo. This section prepares the flow for image support.")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.textSecondary)
                }
            }

            Button("Save Item") {
                viewModel.save(using: wardrobeViewModel)
                dismiss()
            }
        }
        .navigationTitle("Add Item")
    }
}

#Preview {
    NavigationStack {
        AddItemView(wardrobeViewModel: WardrobeViewModel())
    }
}
