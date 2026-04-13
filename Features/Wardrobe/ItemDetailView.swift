import SwiftUI

struct ItemDetailView: View {
    @StateObject var viewModel: ItemDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.gray.opacity(0.12))
                .frame(height: 240)
                .overlay(Image(systemName: viewModel.item.category.iconName).font(.system(size: 42)))

            Text(viewModel.item.name)
                .font(AppTypography.largeTitle)

            Text("\(viewModel.item.color) • \(viewModel.item.season)")
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)

            Spacer()
        }
        .padding(24)
        .background(AppColors.background.ignoresSafeArea())
        .navigationTitle("Item")
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(viewModel: ItemDetailViewModel(item: WardrobeItem.sampleItems[0]))
    }
}
