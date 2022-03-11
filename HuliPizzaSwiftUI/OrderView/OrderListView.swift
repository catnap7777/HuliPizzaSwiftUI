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
//            ListHeaderView(orderModel: orderModel, text: "Your Order")
            //.. can use alignment to move text, etc.
//            List(orderModel.orders) { item in
            //.. better way of doing list with ForEach
            List {
                Section (
                    header: ListHeaderView(orderModel: self.orderModel, text: "Your Order")
                ) {
                    ForEach(orderModel.orders) { item in
                        OrderRowView(orderItem: item)
                    }
                    .onDelete(perform: delete)
                }
            }
        }
    }
    func delete(at offsets: IndexSet) {
        orderModel.orders.remove(atOffsets: offsets)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}


