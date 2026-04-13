import SwiftUI

struct ProductDetailView: View {
    let product: ShoppingItem

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(product.name)
                .font(AppTypography.largeTitle)

            Text(product.brand)
                .font(AppTypography.headline)
                .foregroundStyle(AppColors.textSecondary)

            Text(product.priceText)
                .font(AppTypography.title)

            Text(product.description)
                .font(AppTypography.body)
                .foregroundStyle(AppColors.textSecondary)

            Spacer()
        }
        .padding(24)
        .background(AppColors.background.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: ShoppingItem.sampleItems[0])
    }
}
