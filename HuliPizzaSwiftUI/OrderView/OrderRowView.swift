//
//  OrderRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct OrderRowView: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Your order item here:")
                .font(.headline)
            Spacer()
            Text("$0.00")
                .bold()
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView()
            //.. use this to check what happens if font is too large for screen if user changes something
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}
