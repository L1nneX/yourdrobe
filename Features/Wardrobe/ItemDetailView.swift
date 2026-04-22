import SwiftUI

struct ItemDetailView: View {
    @StateObject var viewModel: ItemDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.gray.opacity(0.12))
                .frame(height: 240)
                .overlay(itemImageOverlay)

            Text(viewModel.item.name)
                .font(AppTypography.largeTitle)

            Text("\(viewModel.item.color) • \(viewModel.item.season)")
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)

            AppCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(AppTypography.headline)

                    Text(viewModel.item.itemDescription)
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.textSecondary)
                }
            }

            Spacer()
        }
        .padding(24)
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Item")
    }

    @ViewBuilder
    private var itemImageOverlay: some View {
        if let imageName = viewModel.item.imageName, !imageName.isEmpty {
            VStack(spacing: 8) {
                Image(systemName: "photo.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(AppColors.textSecondary)

                Text(imageName)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
        } else {
            VStack(spacing: 8) {
                Image(systemName: viewModel.item.category.iconName)
                    .font(.system(size: 42))
                    .foregroundStyle(AppColors.textSecondary)

                Text("No photo added yet")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(viewModel: ItemDetailViewModel(item: WardrobeItem.sampleItems[0]))
    }
}
