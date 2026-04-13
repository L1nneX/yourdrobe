import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = AddItemViewModel()

    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            TextField("Color", text: $viewModel.color)

            Picker("Category", selection: $viewModel.category) {
                ForEach(WardrobeCategory.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }

            Button("Save Item") {
                viewModel.save()
                dismiss()
            }
        }
        .navigationTitle("Add Item")
    }
}

#Preview {
    NavigationStack {
        AddItemView()
    }
}
