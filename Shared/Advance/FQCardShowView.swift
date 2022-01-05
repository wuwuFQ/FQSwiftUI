//
//  FQCardShowView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/31.
//

import SwiftUI

struct FQCardShowView: View {
    @State var show_1 = false
    @State var show_2 = false
    @State var show_3 = false
    @State var viewState = CGSize.zero

    var body: some View {
        ZStack {
            Text("Card")
                .frame(width: 340.0, height: 220.0)
                .background(show_1 ? Color.red : .green)
                .cornerRadius(10.0)
                .shadow(radius: 20)
                .offset(x: 0, y: show_1 ? -400 : -40.0)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show_1 ? 15.0 : 0))
                .rotation3DEffect(Angle(degrees: show_1 ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
//                .animation(Animation.easeInOut(duration: 0.7))
                .offset(x: viewState.width, y: viewState.height)
            
            withAnimation {
                Text("Card")
                    .frame(width: 340.0, height: 220.0)
                    .background(show_2 ? Color.blue : .red)
                    .cornerRadius(10.0)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show_2 ? -200 : -20.0)
                    .scaleEffect(0.9)
                    .rotationEffect(Angle(degrees: show_2 ? 10.0 : 0))
                    .rotation3DEffect(Angle(degrees: show_2 ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
//                    .animation(Animation.easeInOut(duration: 0.5))
                    .offset(x: viewState.width, y: viewState.height)
                
            }
            Text("Card")
                .frame(width: 340.0, height: 220.0)
                .background(show_3 ? Color.orange : .cyan)
                .cornerRadius(10.0)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show_3 ? 5.0 : 0))
                .rotation3DEffect(Angle(degrees: show_3 ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
//                .animation(.spring())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        self.show_1.toggle()
                    }
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.show_2.toggle()
                    }
                    withAnimation(.spring()) {
                        self.show_3.toggle()
                    }
                }
//                .gesture(
//                    DragGesture()
//                        .onChanged({ (value) in
//                            self.viewState = value.translation;
//                            self.show_1 = true;
//                            self.show_2 = true;
//                            self.show_3 = true;
//                        })
//                        .onEnded({ (value) in
//                            self.viewState = CGSize.zero;
//                            self.show_1 = false;
//                            self.show_2 = false;
//                            self.show_3 = false;
//                        })
//                )
        }.navigationTitle("炫酷卡包")
    }
}

struct FQCardShowView_Previews: PreviewProvider {
    static var previews: some View {
        FQCardShowView()
    }
}
