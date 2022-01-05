//
//  FQImageView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQImageView: View {
    @State var showWebImage = false
    var body: some View {
        ScrollView {
            Button("加载网络图片(송지효)") {
                showWebImage = true
            }.popover(isPresented: $showWebImage) {
                FQWebImageView()
            }.padding()
            Image("image02").scaledToFit()
            
            Image("image01")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Image("image03")
                .scaledToFill().navigationTitle("Image")
            
        }.navigationTitle("Image")
    }
}

struct FQImageView_Previews: PreviewProvider {
    static var previews: some View {
        FQImageView()
    }
}
