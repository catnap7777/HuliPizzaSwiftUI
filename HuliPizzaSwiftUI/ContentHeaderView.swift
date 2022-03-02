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
            
        }
        
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}

