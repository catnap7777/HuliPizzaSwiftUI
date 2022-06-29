//
//  MenuDetailView.swift
//  Pizza
//  adaptive version for landscape.
//  creates two functions of views to be able to switch them between Hstack and Vstack.
//  Created by Steven Lipton on 12/26/20.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`

var size:Size = .medium
struct MenuDetailView: View {
    
   @EnvironmentObject var settings:UserPreferences
   @ObservedObject var orderModel:OrderModel
    @State var didOrder:Bool = false
    @State var quantity:Int = 1
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * size.rawValue)
    }
    func addItem(){
//        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    
    //.. from video -> 6.4 -> takes the geometry proxy we get from geometry reader and looks at its height. If its height is greater than 414, which is about where you find most phones' width or height, depending on the smallest size of the phone, that's about the biggest point size right now. It's an arbitrary number. It really should be something that's a little more adaptive, but for this course, we're just going to leave it like that. I can now use this to say, if anything is smaller than that, I'm going to be considering it compact portrait.  I can now go down, back into my body code here, and we got that V stack over here. I'm going to put some if then else stuff here, and so I can say, if is compact portrait, geo, geo, I'll do one thing and then else I'll do another thing.
    func isCompactPortrait(geo:GeometryProxy)->Bool{
        return geo.size.height <= 414
    }
    
    func titleView()->some View{
         return
            //.. GeometryReader to set proportions on phone
            GeometryReader { geometry in
                HStack{
                    //.. so with frame below, this gives 3/5 for image and 2/5 for text in this hstack
                    SelectedImageView(image: "\(self.menuItem.id)_250w")
                        .padding(5)
                    //.. so with frame below, this gives 3/5 for image and 2/5 for text in this hstack
                    Text(self.menuItem.description)
                        .padding()
                        .frame(width: geometry.size.width * 2/5)
                        .font(geometry.size.height > 200 ? .body : .caption)
                    Spacer()
                }
            }
                
    }
    
    
    
    
    func menuOptionsView()-> some View{
       return  VStack{
            SizePickerView(size:$settings.size)
            QuantityStepperView(quantity:$quantity)
            PageTitleView(title: "Order:  \(formattedPrice)")
            Spacer()
        }
    }
        
    
    var body: some View {
        //..GeometryReader to set for portrait vs landscape
        GeometryReader { geo in
            VStack {
                HStack{
                    PageTitleView(title: self.menuItem.name)
                    Button(action: self.addItem) {
                        Text("Add to order")
                            //.. set the font depending on orientation - portrait vs landscape
                            //.. Note: staticFont defined in PageTitleView.swift
                            .font(isCompactPortrait(geo: geo) ? staticFont: .title)
                            .fontWeight(.bold)
                            .padding([.leading,.trailing])
                            .background(Color("G3"))
                            .foregroundColor(Color("IP"))
                            .cornerRadius(5)
                    }
                    .sheet(isPresented: self.$didOrder){
                        ConfirmView(menuID: self.menuItem.id, orderModel:self.orderModel, isPresented: self.$didOrder, quantity: self.$quantity, size:self.$settings.size)
                    }
                }
                
                //.. Figure out the orientation you want to use
                //.. From video -> 6.4 -> Pretty much, I've just taken the title view and menu options view that I already had. And if it's portrait, I'm going to move them side by side. So if I have them in one situation, I'm going to have an Hstack and in the other situation, I'll have it a Vstack.
                if isCompactPortrait(geo: geo) {
                    HStack{
                        self.titleView()
                        self.menuOptionsView()
                    }
                } else {
                    VStack{
                        self.titleView()
                        self.menuOptionsView()
                    }

                }
                
                
            }//Root VStack
            .padding(.top, 5)
        }
            
    }// body
}// MenuDetailView
struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel:OrderModel(),menuItem: testMenuItem)
            .environmentObject(UserPreferences())
    }
}

struct QuantityStepperView: View {
    @Binding var quantity:Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10){
            Text("Quantity \(quantity)")
        }
            .padding()
    }
}


struct SizePickerView: View {
    
    @Binding var size:Size
    let sizes:[Size] = [.small,.medium,.large]
    var body: some View {
        Picker(selection:$size, label:Text("Pizza Size")){
            ForEach(sizes, id:\.self){ size in
                Text(size.formatted()).tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.headline)
    }
}

