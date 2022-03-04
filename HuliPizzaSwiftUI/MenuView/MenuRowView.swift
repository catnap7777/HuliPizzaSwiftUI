//
//  MenuRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct MenuRowView: View {
    //.. MenuItem is the struct inside MenuModel.swift; testMenuItem is in there too
    var menuItem: MenuItem = testMenuItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 15) {
                Image("\(menuItem.id)_100w")
    //                .cornerRadius(10)
    //                .border(Color("G4"), width: 2)
    //                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5.0, y: 5.0)
                VStack(alignment: .leading) {
                    Text(menuItem.name)
                        .font(.title)
                        .fontWeight(.light)
                    RatingsView(count: menuItem.rating)
                }
                //.. to left justify HStack
                //Spacer()
            }
            Text(menuItem.description)
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        //MenuRowView()
        //.. put values in here to check if individual pizzas show up; MenuModel is the struct name and menu is the array of MenuItems
        MenuRowView(menuItem: MenuModel().menu[7])
        
        //.. use this to check what happens if font is too large for screen if user changes something
            //.environment(\.sizeCategory, .accessibilityExtraExtraLarge)
        
    }
}


