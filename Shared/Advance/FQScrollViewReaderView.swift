//
//  FQScrollViewReaderView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/23.
//

import SwiftUI

struct FQScrollViewReaderView: View {
    @Namespace var topID
    @Namespace var bottomID
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to Bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }.padding()
                .id(topID)
                
                Button("Scroll to center") {
                    withAnimation {
                        proxy.scrollTo(50, anchor: UnitPoint.center)
                    }
                }.padding()
                 

                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        if i == 50 {
                            Text("我是中心，也可以是任意位置").frame(height: 32).id(i)
                        } else {
                            color(fraction: Double(i) / 100)
                                .frame(height: 32).id(i)
                        }
                    }
                }
                
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .id(bottomID)
            } .navigationTitle("滚到指定位置")
        }
    }
    
    func color(fraction: Double) -> Color {
        Color(red: 1 - fraction, green:  fraction, blue: 0.8)
    }
    
}

struct FQScrollViewReaderView_Previews: PreviewProvider {
    static var previews: some View {
        FQScrollViewReaderView()
    }
}
