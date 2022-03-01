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
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
            Image("Surf Board")
            Text("Order Pizza")
            //.. spacers push everything away from the closest margin or object; since this is at bottom of vstack, it pushes whole thing up toward top
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
