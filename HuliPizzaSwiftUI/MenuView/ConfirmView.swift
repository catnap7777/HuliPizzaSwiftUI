//
//  ConfirmView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/13/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct ConfirmView: View {
    var menuID:Int
    @ObservedObject var orderModel:OrderModel
    @Binding var isPresented: Bool
    @Binding var quantity: Int
    @Binding var size: Size
    @State var comments: String = ""
    
    ///extracts the menu item name based on `menuID`
    var name:String{
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem(){
        orderModel.add(menuID: menuID, size: size, quantity: quantity, comments: comments)
        isPresented = false
    }
    
    var body: some View {
        VStack{
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading)
            Divider()
            SelectedImageView(image: "\(menuID)_250w")
                .padding(10)
                //.. count 2 to dismiss on doubletap of the picture (note: this is one way to dismiss)
//                .onTapGesture(count: 2) {
//                    self.isPresented = false
//                }
            //.. second way to do this is with more generic way as follows to dismiss gesture
                .gesture(
                    TapGesture(count: 2)
                        .onEnded {
                            self.isPresented = false
                        }
                 )
            Divider()
            Text("Confirm your order of \(quantity) \(size.formatted()) \(name) pizza")
                .font(.headline)
            TextField("Add your comments here", text: $comments)
                .background(Color("G4"))
            Spacer()
            Button(action: addItem){
                Text("Add")
                    .font(.title)
                .padding()
                .background(Color("G4"))
                .cornerRadius(10)
            }.padding([.bottom])
        }
        .background(Color("G3"))
        .foregroundColor(Color("IP"))
        .cornerRadius(20)
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(menuID: 0, orderModel: OrderModel(), isPresented: .constant(true), quantity: .constant(1), size: .constant(.small))
    }
}
