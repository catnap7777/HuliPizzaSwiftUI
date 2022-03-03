//
//  MenuRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct MenuRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image("1_100w")
//                .cornerRadius(10)
//                .border(Color("G4"), width: 2)
//                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5.0, y: 5.0)
            VStack(alignment: .leading) {
                Text("Huli Chicken Pizza")
                    .font(.title)
                    .fontWeight(.light)
                RatingsView()
            }
            //.. to left justify HStack
            //Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView()
        //.. use this to check what happens if font is too large for screen if user changes something
            //.environment(\.sizeCategory, .accessibilityExtraExtraLarge)
        
    }
}


