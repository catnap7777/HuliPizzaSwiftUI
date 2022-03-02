//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ContentHeaderView()
            MenuListView()
            OrderListView()
            //.. spacers push everything away from the closest margin or object; since this is at bottom of VStack, it pushes whole thing up toward top
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //.. to have multiple devices previewed, use Group and put another ContentView
            ContentView()
                .previewDevice("iPhone 12 Pro")
                .previewDisplayName("iPhone 12 Pro")
            
            ContentView()
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
