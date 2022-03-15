//
//  HistoryDetailView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/18/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct HistoryDetailView: View {
    var historyItem:HistoryItem
    @Binding var imageID:Int
    @State var isPresented: Bool = false
    var body: some View {
        //.. since imageID is inside "var body", you have to use a "return" to return a view... otherwise it blows up.  In body, it must be a view (I think)
        imageID = historyItem.id
        return VStack {
            PageTitleView(title: historyItem.name)
            MapView(latitude: historyItem.latitude, longitude: historyItem.longitude, regionRadius: 1000000)
                .frame(height: 100)
            //.. put the button after MapView because mapview has focus. Button will overlay on map
            PresentMapButton(isPresented: $isPresented, historyItem: historyItem)
                .foregroundColor(.yellow)
            Text(historyItem.history)
                .frame(height:300)
            Spacer()
        }
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView(historyItem:HistoryModel().historyItems[0], imageID: .constant(0))
    }
}
