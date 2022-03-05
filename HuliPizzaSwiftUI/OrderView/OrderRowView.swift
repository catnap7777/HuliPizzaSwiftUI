//
//  OrderRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct OrderRowView: View {
    var orderItem: OrderItem
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(orderItem.description)
                .font(.headline)
            Spacer()
            Text(orderItem.formattedExtendedPrice)
                .bold()
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(orderItem: testOrderItem)
            //.. use this to check what happens if font is too large for screen if user changes something
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}
