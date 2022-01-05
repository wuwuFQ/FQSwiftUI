//
//  FQMeterView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/30.
//

import SwiftUI

struct FQMeterManageView: View {
    @State private var value = 20.0
    @State var timerUP: Timer?
    @State var timerDown: Timer?
    
    var body: some View {
        FQMeterView(value: $value)
        HStack {
            Spacer()
            Text("刹车").padding(20).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                .onLongPressGesture(minimumDuration: CGFloat.greatestFiniteMagnitude, maximumDistance: CGFloat.greatestFiniteMagnitude) {
                } onPressingChanged: {result in
                    print("wuwuFQ:\(result ? "开始按压" : "按压结束")")
                    if result {
                        timerDown = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { t in
                            withAnimation {
                                value -= 5
                                if value <= 0 {
                                    value = 0
                                }
                            }
                        })
                    } else {
                        timerDown?.invalidate()
                        timerDown = nil
                    }
                }
            
            
            Spacer()
            Text("给油").padding(20).foregroundColor(.black).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.red))
                .onLongPressGesture(minimumDuration: CGFloat.greatestFiniteMagnitude, maximumDistance: CGFloat.greatestFiniteMagnitude) {
                } onPressingChanged: {result in
                    print("wuwuFQ:\(result ? "开始按压" : "按压结束")")
                    if result {
                        timerUP = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { t in
                            if value > 200 {
                                withAnimation(.spring()) {
                                    value -= 5
                                }
                            } else {
                                withAnimation(.spring()) {
                                    value += 5
                                }
                            }
                        })
                    } else {
                        if value > 200 {
                            withAnimation(.spring()) {
                                value = 200
                            }
                        }
                        timerUP?.invalidate()
                        timerUP = nil
                    }
                }
            
            Spacer()
        }.navigationTitle("模拟仪表盘")
    }
    
    
}
struct FQMeterView: View {
    let lowLocations: [Double] = [-22.5, 0, 22.5, 45, 67.5, 90, 112.5, 135, 157.5, 180, 202.5]
    let longLocations: [Double] = [-11.25, 11.25, 33.75, 56.25, 78.75, 101.25, 123.75, 146.25, 168.75, 191.25, 191.25]
    let texts: [String] = ["0", "20", "40", "60", "80", "100", "120", "140", "160", "180", "200"]
    @Binding var value: Double
    
    
    var body: some View {
        ZStack {
            Text("\(value, specifier: "%0.0f")")
                .font(.system(size: 40, weight: Font.Weight.bold))
                .foregroundColor(fillColor())
                .offset(x: 0, y: 40)
            ForEach(0..<texts.count) { i in
                let low = lowLocations[i]
                let long = longLocations[i]
                let text = texts[i]
                if i < 2 {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 6)
                        .offset(x: -140, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 4)
                        .offset(x: -150, y: 0)
                        .rotationEffect(.init(degrees: long), anchor: .center)
                    Text(text)
                        .font(.system(size: 18, weight: Font.Weight.bold))
                        .foregroundColor(.blue)
                        .rotationEffect(.init(degrees: -low), anchor: .center)
                        .offset(x: -100, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                    
                } else if i > 7 {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 40, height: 6)
                        .offset(x: -140, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 20, height: 4)
                        .offset(x: -150, y: 0)
                        .rotationEffect(.init(degrees: long), anchor: .center)
                    Text(text)
                        .font(.system(size: 18, weight: Font.Weight.bold))
                        .foregroundColor(.red)
                        .rotationEffect(.init(degrees: -low), anchor: .center)
                        .offset(x: -100, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                    
                } else {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 40, height: 6)
                        .offset(x: -140, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 20, height: 4)
                        .offset(x: -150, y: 0)
                        .rotationEffect(.init(degrees: long), anchor: .center)
                    Text(text)
                        .font(.system(size: 18, weight: Font.Weight.bold))
                        .foregroundColor(.orange)
                        .rotationEffect(.init(degrees: -low), anchor: .center)
                        .offset(x: -100, y: 0)
                        .rotationEffect(.init(degrees: low), anchor: .center)
                }
                
            }
            
            NeedleShape()
                .fill(fillColor())
                .frame(width: 120, height: 6)
                .offset(x: -60, y: 0)
                .rotationEffect(.init(degrees: getAngle(value: value)), anchor: .center)
                .animation(.linear, value: 2.0)
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
        }.padding(.vertical, 80)
    }
    
    func fillColor() -> Color {
        if value < 40 {
            return Color.blue
        } else if value > 160 {
            return Color.red
        } else {
            return Color.orange
        }
    }
    
    func getAngle(value: Double) -> Double {
        return value/200*225-22.5
    }
}



fileprivate struct NeedleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height/2 + 1))
        return path
    }
}

struct FQMeterView_Previews: PreviewProvider {
    static var previews: some View {
        FQMeterManageView()
    }
}
