//
//  FQColorPickerView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI

struct FQColorPickerView: View {
    @State private var isPresented = false
    
    var body: some View {
        Button("全新的本地颜色选择器") {
            isPresented.toggle()
        }.sheet(isPresented: $isPresented) {
            
        } content: {
            FQColorPickerView_sheet()
        }

            
    }
}
struct FQColorPickerView_sheet: View {
    @State private var bgColor =
    Color(.sRGB, red: 0.58, green: 0.5, blue: 0.2)
    
    var body: some View {
        VStack {
            ColorPicker("点击右侧改变我的颜色", selection: $bgColor).foregroundColor(bgColor)
        }.frame(width: 220, height: 40, alignment: .center)
            
            
    }
}

struct FQColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        FQColorPickerView()
    }
}
