//
//  MenuListView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel: OrderModel
    var menuList = MenuModel().menu
    var body: some View {
        //.. can use alignment to move text, etc.
        VStack {
            ListHeaderView(orderModel: orderModel, text: "Menu")
            NavigationView {
                List(menuList) { item in
                    NavigationLink(destination: MenuDetailView(orderModel: orderModel, menuItem: item)) {
                        MenuRowView(menuItem: item)
                            //.. to increase or decrease for white space
                            .listRowInsets(EdgeInsets())
                    }
                }
                .navigationBarTitle("Pizza Order")
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel: OrderModel())
    }
}



