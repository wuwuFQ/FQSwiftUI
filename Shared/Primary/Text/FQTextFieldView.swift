//
//  FQTextFieldView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQTextFieldView: View {
    @State var name: String = ""
    @State var pwd: String = ""
    var body: some View {
        HStack {
            Text("昵称：")
                .foregroundColor(.secondary)
            TextField("请输入账户名称", text: $name)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .onChange(of: name) { newValue in
                    print(newValue)
                }
            
        }.frame(height: 40).padding(20)
        HStack {
            Text("密码：")
                .foregroundColor(.secondary)
            SecureField("请输入密码", text: $pwd)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .onChange(of: pwd) { newValue in
                    print(newValue)
                }
            
        }.frame(height: 40).padding(20)
        HStack {
            Text("登录系统")
                .frame(width: 200, height: 30)
                .background(.cyan)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
        .shadow(color: .black, radius: 5, x: 1, y: 3)
        .onTapGesture {
            print("恭喜，登录成功！")
        }
        .navigationTitle("TextField")
        
    }
}

struct FQTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FQTextFieldView()
    }
}
