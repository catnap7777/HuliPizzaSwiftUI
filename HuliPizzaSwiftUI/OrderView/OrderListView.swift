//
//  OrderListView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct OrderListView: View {
    //.. don't need a binding orderModel var here because really, this is just "read only"
    var orderModel: OrderModel
    var body: some View {
        VStack {
            ListHeaderView(text: "Your Order")
            //.. can use alignment to move text, etc.
            List(orderModel.orders) { item in
                OrderRowView(orderItem: item)
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}


