//
//  ContentHeaderView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack{
            //.. order of how you put things in Zstack matters; if for example, you listed Text first and Image second, the image will overlay the Text. So, you have to do it the other way here to have text on top of image
            ZStack {
                Image("Surf Board")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 300, idealWidth: 500, maxWidth: 600, minHeight: 75, idealHeight: 143, maxHeight: 150, alignment: .center)
                Text("Huli Pizza Company")
                    //.. use custom font here so it doesn't scale
                    .font(Font.custom("Chalkboard SE", size: 10))
                    //.font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
            }
            //.. used to be this way without ZStack
//            Text("Huli Pizza Company")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.green)
//            Image("Surf Board")
//                .resizable()
//                .scaledToFit()
            
        }
        
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
            //.. use this to check what happens if font is too large for screen if user changes something... but in this case, "Huli Pizza Company" is too big and we do NOT want scaleable font... so, above on text, we will put another modifier - (ie. use custom font)
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}

