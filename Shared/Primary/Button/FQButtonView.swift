//
//  FQButtonView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQButtonView: View {
    
    
    var body: some View {
        VStack {
            Button("我是一个按钮") {
                FQToast.toast("我是一个按钮")
            }
            .padding()
            
            
            Button {
                FQToast.toast("我不是一般的按钮")
            } label: {
                HStack {
                    Image(systemName: "book")
                    Text("我不是一般的按钮")
                    Image(systemName: "arrow.right")
                }
                .frame(height: 50)
                .background {
                    Rectangle().fill(.yellow)
                }
            }
            .padding()
            
            
            Button {
                
            } label: {
                VStack{
                    Text("我")
                    Text("也")
                    Text("是")
                    Text("个")
                    Text("按")
                    Text("🐂")
                }.padding()
            }.buttonStyle(.bordered)
            
            Button(role: .destructive) {
                
            } label: {
                Text("你还是把我删了吧")
            }.padding()
            
        }
        .navigationTitle("Button")
        
    }
}

struct FQButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FQButtonView()
    }
}
