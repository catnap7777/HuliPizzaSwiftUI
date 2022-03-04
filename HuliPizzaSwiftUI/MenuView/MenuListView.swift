//
//  MenuListView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct MenuListView: View {
    var menuList = MenuModel().menu
    var body: some View {
        //.. can use alignment to move text, etc.
        VStack {
            ListHeaderView(text: "Menu")
            List(menuList) { item in
                MenuRowView(menuItem: item)
                    //.. to increase or decrease for white space
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}



