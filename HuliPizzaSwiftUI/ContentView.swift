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
            Text("Huli Pizza Company")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
            Image("Surf Board")
                .resizable()
                .scaledToFit()
            Text("Order Pizza")
                .font(.largeTitle)
            //.. spacers push everything away from the closest margin or object; since this is at bottom of vstack, it pushes whole thing up toward top
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                //.. for dark mode
                .colorScheme(.dark)
                .background(Color.black)
            //.. for specific device preview
                .previewDevice("iPad Pro (9.7-inch)")
                .previewDisplayName("iPad Pro 9.7 inch")
            //.. to have multiple devices previewed, use Group and put another ContentView
            ContentView()
                .previewDevice("iPhone 12 Pro")
                .previewDisplayName("Karen's iPhone 12 Pro")
        }
    }
}
