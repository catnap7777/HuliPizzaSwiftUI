//
//  RatingsView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct RatingsView: View {
    var body: some View {
        HStack {
            //..must imbed in Hstack because it defaults to VStack
            ForEach(0..<4) { item in
                Image("Pizza Slice")
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView()
    }
}
