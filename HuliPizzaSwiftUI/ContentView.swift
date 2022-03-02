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
            //.. order of how you put things in Zstack matters; if for example, you listed Text first and Image second, the image will overlay the Text. So, you have to do it the other way here to have text on top of image
            ZStack {
                Image("Surf Board")
                    .resizable()
                    .scaledToFit()
                Text("Huli Pizza Company")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.green)
            }
            //.. used to be this way without ZStack
//            Text("Huli Pizza Company")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.green)
//            Image("Surf Board")
//                .resizable()
//                .scaledToFit()
            Text("Order Pizza")
                .font(.largeTitle)
            //.. spacers push everything away from the closest margin or object; since this is at bottom of VStack, it pushes whole thing up toward top
            Text("Menu")
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack(alignment: .top, spacing: 15) {
                    //.. can use alignment to move text, etc.
                    Image("1_100w")
                    Text("Huli Chicken Pizza")
                    //.. to left justify HStack
                    Spacer()
                }
            }
            Text("Your Order")
            //.. can use alignment to move text, etc.
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack(alignment: .firstTextBaseline) {
                    Text("Your order item here:")
                    Spacer()
                    Text("$0.00")
                }
            }
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
