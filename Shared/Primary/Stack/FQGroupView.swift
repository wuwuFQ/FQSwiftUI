//
//  FQGroupView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQGroupView: View {

    var body: some View {
        VStack {
            Group {
                Text("我们")
                Text("生在红旗下")
                Text("长在春风里")
            }.padding(8).foregroundColor(.randomColor())
            Group {
                Text("人民有信仰")
                Text("国家有力量")
                Text("民族有希望")
            }.padding(8).foregroundColor(.randomColor())
            Group {
                Text("目光所至皆为华夏")
                Text("五星闪耀皆为信仰")
            }.padding(8).foregroundColor(.randomColor())
        }.navigationTitle("Group")
    }
}

struct FQGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FQGroupView()
    }
}
