//
//  FQCircleRotateView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/31.
//

import SwiftUI

struct FQCircleRotateView: View {
    
    @ObservedObject var control = RotateControl()
    
    let colors = [Color.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    var body: some View {
        ZStack {
            ForEach(0..<control.index, id: \.self) { idx in
                Path { path in
                    path.move(to: CGPoint(x: 150, y: 150))
                    path.addArc(center: CGPoint(x: 150, y: 150),
                                radius: 150,
                                startAngle: Angle(degrees: Double(idx) * self.control.angle),
                                endAngle: Angle(degrees: Double(idx+1) * self.control.angle),
                                clockwise: false)
                    path.addLine(to: CGPoint(x: 150, y: 150))
                }.fill(self.colors[idx%self.colors.count])
            }
        }.frame(width: 300, height: 300,
                alignment: .center)
            .rotationEffect(.degrees(control.rotation))
            .navigationTitle("彩虹的圆")
    }
}



final class RotateControl: ObservableObject {
    @Published var rotation = 0.0
    let index = 7
    var angle: Double { 360 / Double(index) }
    
    init() {
        print("init runed:\(angle)")
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (timer) in
            self.rotation += 30
        }
    }
}
struct FQCircleRotateView_Previews: PreviewProvider {
    static var previews: some View {
        FQCircleRotateView()
    }
}
