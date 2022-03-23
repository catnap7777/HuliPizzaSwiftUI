//
//  PageTitleView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/2/22.
//

import SwiftUI

//.. global variable
let staticFont = Font.system(size: 22)

struct PageTitleView: View {
    //.. to use system environment var to size fonts
    //.. from video -> 6.5 -> So that'd be @Environment to get the wrapper. And environment variables that are coming from the system, you can actually use a key path to get them. So I'm going to put a parentheses here and then a ./ and this one's called vertical size class. And of course, though, I was looking for the horizontal size class, that'd be a horizontal size class. Now, once you put that in there, then you put var and then the name of it, which I'm going to use sizedClass here, like that. Now I've got another issue I'm going to watch out for because in these compact sizes, the dynamic type we've been using up to this point becomes an issue. You should use dynamic type whenever possible, allowing the user to control the font size. But sometimes that's going to mess with your layout. When it does, you going to want a static type.
    @Environment(\.verticalSizeClass) var sizeClass
    var title: String
    var isDisplayingOrders: Bool! = nil
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                //.. from video 6.5 @ 5:42 -> I don't have a problem with dynamic type when I'm in portrait, I only have a problem with it in landscape and I have now handled that situation. 
                .font(sizeClass != .compact ? .largeTitle : staticFont)
                .fontWeight(.heavy)
                .padding(.trailing)
        } .overlay(
//            Image(systemName: isDisplayingOrders ?? false ? "chevron.up.square" : "chevron.down.square")
            Image(systemName: "chevron.up.square")
                .rotationEffect(isDisplayingOrders ?? false ? Angle(degrees: 0.0) : Angle(degrees: 180.0))
                .animation(.easeInOut(duration: 0.5))
                //.. from video 6.5 @ 5:42 -> I don't have a problem with dynamic type when I'm in portrait, I only have a problem with it in landscape and I have now handled that situation.
                .font(sizeClass != .compact ? .title : staticFont)
                .foregroundColor(isDisplayingOrders != nil ? Color("G1") : .clear)
                .padding(),alignment: .leading
                
        )
        .foregroundColor(Color("G1"))
        .background(Color("G4"))
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Order Pizza", isDisplayingOrders: true)
    }
}
