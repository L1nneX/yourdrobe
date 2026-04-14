import SwiftUI

struct WardrobeGridView: View {
    @StateObject private var viewModel = WardrobeViewModel()

    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        ItemDetailView(viewModel: ItemDetailViewModel(item: item))
                    } label: {
                        AppCard {
                            VStack(alignment: .leading, spacing: 8) {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.gray.opacity(0.12))
                                    .frame(height: 110)
                                    .overlay(Image(systemName: item.category.iconName))

                                Text(item.name)
                                    .font(AppTypography.headline)
                                    .foregroundStyle(AppColors.textPrimary)

                                Text(item.color)
                                    .font(AppTypography.caption)
                                    .foregroundStyle(AppColors.textSecondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Wardrobe")
        .toolbar {
            NavigationLink("Add") {
                AddItemView(wardrobeViewModel: viewModel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WardrobeGridView()
    }
}