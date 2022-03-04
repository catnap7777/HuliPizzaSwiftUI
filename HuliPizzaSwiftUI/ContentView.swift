//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var isMenuDisplayed: Bool = true
    @State var orderModel: OrderModel
    
    var body: some View {
        VStack {
            //.. too big on screen, so get rid of
//            ContentHeaderView()
//                .layoutPriority(2)
            Button(action: { self.isMenuDisplayed.toggle()}) {
                //.. we don't set layoutPriority for PageTitleView bc it already has some absolute settings that we set earlier
                PageTitleView(title: "Order Pizza", isDisplayingOrders: isMenuDisplayed)
                    .padding(.bottom, 2)
            }
            MenuListView()
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView()
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
            //.. spacers push everything away from the closest margin or object; since this is at bottom of VStack, it pushes whole thing up toward top
            //Spacer()
        }
        //.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //.. to have multiple devices previewed, use Group and put another ContentView
            ContentView(orderModel: OrderModel())
                .previewDevice("iPhone 12 Pro")
                .previewDisplayName("iPhone 12 Pro")
            
            ContentView(orderModel: OrderModel())
                //.. for dark mode
                .colorScheme(.dark)
                .background(Color.black)
            //.. for specific device preview
//                .previewDevice("iPad Pro (9.7-inch)")
//                .previewDisplayName("iPad Pro 9.7 inch")
                .previewDevice("iPhone 11")
                .previewDisplayName("iPhone 11 Dark Mode")
            
        }
    }
}
