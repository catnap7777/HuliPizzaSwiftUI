//
//  HistoryRowView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

struct HistoryRowView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("1_100w")
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5.0, y: 5.0)
            Text("Huli Chicken")
                .font(.title)
            //.. use spacer to spread things out and make whole frame bigger
            Spacer()
        } .overlay(
            Image(systemName: "chevron.right.square")
                .padding()
                .font(.title)
                .foregroundColor(Color("G3"))
                ,alignment: .trailing
        )
        
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView()
    }
}
