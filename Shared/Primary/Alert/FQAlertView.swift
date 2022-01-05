//
//  FQAlertView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/21.
//

import SwiftUI

struct FQAlertView: View {
    @State var showAlert_1 = false
    @State var showAlert_2 = false

    var body: some View {
        Button {
            showAlert_1 = true
        } label: {
            Text("删除一条消息")
        }.padding()
        .alert("删除", isPresented: $showAlert_1) {
            Button("取消", role: .cancel) {
                print("取消")
            }
            Button("确定", role: .destructive) {
                print("确定删除")
            }
            
        } message: {
            Text("您确定要删除这个消息吗？")
        }
        
        Button {
            showAlert_2 = true
        } label: {
            Text("支付一个订单")
        }.padding()
        .alert("支付", isPresented: $showAlert_2) {
            Button("当然了") {
                print("当然了")
            }
            Button("朋友代付") {
                print("朋友代付")
            }
            Button("我再想一想") {
                print("我再想一想")
            }
        } message: {
            Text("您确定要支付这笔费用吗？")
        }

        .navigationTitle("Alert")
    }
}

struct FQAlertView_Previews: PreviewProvider {
    static var previews: some View {
        FQAlertView()
    }
}
