//
//  MenuListView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct MenuListView: View {
    var body: some View {
        VStack {
            Text("Menu")
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                //.. can use alignment to move text, etc.
                HStack(alignment: .top, spacing: 15) {
                    Image("1_100w")
                    VStack {
                        Text("Huli Chicken Pizza")
                        HStack {
                            //..must imbed in Hstack because it defaults to VStack
                            ForEach(0..<4) { item in
                                Image("Pizza Slice")
                            }
                        }
                    }
                    //.. to left justify HStack
                    Spacer()
                }
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
