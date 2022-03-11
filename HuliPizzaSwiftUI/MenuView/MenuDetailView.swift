//
//  MenuDetailView.swift
//  Pizza
//
//  Created by Steven Lipton on 9/2/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`
struct MenuDetailView: View {
    let sizes: [Size] = [.small, .medium, .large]
    @ObservedObject var orderModel: OrderModel
    @EnvironmentObject var settings: UserPreferences
    @State var didOrder: Bool = false
    @State var quantity: Int = 1
    
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * settings.size.rawValue)
    }
    func addItem(){
        //.. don't need this here when presenting sheet; do need for just alert from below
//        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    
    var body: some View {
        VStack {
            PageTitleView(title: menuItem.name)
            SelectedImageView(image: "\(menuItem.id)_250w")
                .padding(5)
                .layoutPriority(3)
            
            Text(menuItem.description)
                .lineLimit(5)
                .padding()
                .layoutPriority(3)
                
            Spacer()
            Text("Pizza Size")
                .fontWeight(.heavy)
                .foregroundColor(Color.green)
                .underline()
                
            //.. note: according to https://www.hackingwithswift.com/forums/swiftui/swiftui-xcode-12-2-picker-no-longer-shows-label/4809 Xcode 12 no longer shows picker label
            Picker(selection: $settings.size, label:Text("Pizza Size")) {
                ForEach(sizes, id: \.self) { size in
                    Text(size.formatted()).tag(size)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color("kamLightGreen"))
                
//            HStack{
//                Spacer()
//                Text("Pizza size")
//                Text(settings.size.formatted())
//            }
            .font(.headline)
            Stepper(value: $quantity, in: 1...10) {
                Text("Quantity: \(quantity)")
                    .bold()
            }
            
//            HStack{
//                Text("Quantity:")
//                Text("1")
//                    .bold()
//                Spacer()
//            }
            .padding()
            HStack{
                Text("Order:  \(formattedPrice)")
                    .font(.headline)
                Spacer()
                Text("Order total: " + orderModel.formattedTotal)
                    .font(.headline)
            }
            .padding()
            HStack{
                Spacer()
                Button(action: addItem) {
                   Text("Add to order")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    .background(Color("G4"))
                        .foregroundColor(Color("IP"))
                        .cornerRadius(5)
                }
//                .alert(isPresented: $didOrder) {
//                    Alert(title: Text("Pizza Ordered"), message: Text("You ordered a " + self.menuItem.name))
                .sheet(isPresented: $didOrder) {
                    ConfirmView(menuID: self.menuItem.id, orderModel: self.orderModel, isPresented: self.$didOrder, quantity: $quantity, size: self.$settings.size)
                }
                Spacer()
            }
            .padding(.top)
            Spacer()
        }
        
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel: OrderModel(), menuItem: testMenuItem)
            .environmentObject(UserPreferences())
    }
}
