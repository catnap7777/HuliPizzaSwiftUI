//
//  SelectedImageView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/3/22.
//

import SwiftUI

struct SelectedImageView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5.0, y: 5.0)
    }
}

struct SelectedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedImageView(image: "1_250w")
    }
}
