//
//  FQToggleView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQToggleView: View {
    @State var isOn = false
    var body: some View {
        Toggle.init(isOn: $isOn) {
            Text("这是个开关啊：" + (isOn ? "开灯" : "关灯"))
        }.padding(30)
        .navigationTitle("Toggle")
    }
}

struct FQToggleView_Previews: PreviewProvider {
    static var previews: some View {
        FQToggleView()
    }
}
