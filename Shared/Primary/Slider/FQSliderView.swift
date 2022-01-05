//
//  FQSliderView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQSliderView: View {
    @State var rating = 0.5
    var body: some View {
        VStack {
            Text("Slider Value: \(self.rating)")
            Slider(value: $rating)
                .padding(30)
            
            ProgressView("ProgressView", value: rating)
                .tint(.green)
                .progressViewStyle(.linear)
                .shadow(color: Color(red: 0.3, green: 0.1, blue: 1), radius: 5.0, x: 2.0, y: 4.0)
            ProgressView("Progress circular",value: rating)
                .progressViewStyle(.circular)
        }.navigationTitle("Slider/ProgressView")
    }
}

struct FQSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FQSliderView()
    }
}
