//
//  RatingsView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct RatingsView: View {
    var count: Int = 5
    var rating: [String] {
        //.. all shape symbols have versions with a number in front of them
        let symbolName = "\(count).circle"
        return Array(repeating: symbolName, count: count)
    }
    var body: some View {
        //..must imbed in Hstack because it defaults to VStack
        HStack {
            ForEach(rating, id:\.self) { item in
                //Image("Pizza Slice")
                Image(systemName: item)
                    .font(.headline)
                    .foregroundColor(Color("G4"))
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView()
    }
}
