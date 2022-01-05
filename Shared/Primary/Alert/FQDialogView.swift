//
//  FQDialogView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/21.
//

import SwiftUI

struct FQDialogView: View {
    @State private var showActionSheet = false
    var body: some View {
        Button("Show Action Sheet") {
            showActionSheet = true
        }
        .confirmationDialog("上传", isPresented: $showActionSheet, actions: {
            Button("手机相册"){
                
            }
            Button("相机拍照"){
                
            }
            Button("取消", role: .cancel){
                
            }

        }, message: {
            Text("请选择图片来源")
        })
        
            .navigationTitle("Dialog")
    }
}

struct FQSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FQDialogView()
    }
}
