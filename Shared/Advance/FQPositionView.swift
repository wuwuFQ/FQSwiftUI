//
//  FQPositionView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/28.
//

import SwiftUI

struct FQPositionView: View {
    var body: some View {
        Text("我在任意位置").background(.red).position(x: 150, y: 155)
        VStack {
            Text("视图默认居中，向上偏移10").offset(x: 0, y: -10).background(.red).border(.blue).padding()
            Text("视图默认居中，向右偏移50").offset(CGSize(width: 50, height: 0)).background(.green).border(.blue).padding()
            Text("视图默认居中，向右偏移50").alignmentGuide(HorizontalAlignment.center) { _ in
                50
            }.background(.yellow).border(.blue).padding()
            Text("视图偏移会影响其他的布局，而且链式调用的顺序不一样，产生的效果也不一样，先padding后background 和 先background后padding的效果是不一样的，自己可以多试试其他效果").padding().background(.yellow).border(.blue)
        }.layoutPriority(2)
        .background(.gray)
        .navigationTitle("视图偏移")
    }
}

struct FQPositionView_Previews: PreviewProvider {
    static var previews: some View {
        FQPositionView()
    }
}
