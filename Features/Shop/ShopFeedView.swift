import SwiftUI

struct ShopFeedView: View {
    @StateObject private var viewModel = ShopViewModel()

    var body: some View {
        List(viewModel.products) { product in
            NavigationLink {
                ProductDetailView(product: product)
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(product.name)
                        .font(AppTypography.headline)
                    Text(product.brand)
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.textSecondary)
                    Text(product.priceText)
                        .font(AppTypography.body)
                }
                .padding(.vertical, 6)
            }
        }
        .navigationTitle("Shop")
    }
}

#Preview {
    NavigationStack {
        ShopFeedView()
    }
}
