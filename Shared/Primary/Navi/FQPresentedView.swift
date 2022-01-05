//
//  FQPresentedView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQPresentedView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var fullScreen = false
    @State var presented = false
    var body: some View {
        
        Button {
            withAnimation(.spring()) {
                self.fullScreen.toggle()
            }
        } label: {
            Text("fullScreen").foregroundColor(.randomColor())
        }.padding()
        .fullScreenCover(isPresented: $fullScreen, onDismiss: {
            print("ondismiss")
        }, content: {
            FQPresentedView()
        })

        Button {
            withAnimation(.spring()) {
                self.presented.toggle()
            }
        } label: {
            Text("sheet").foregroundColor(.randomColor())
        }.padding()
            .sheet(isPresented: $presented) {
                //ondismiss
                print("ondismiss")
            } content: {
                FQPresentedView()
            }
        
        Button("dismiss") {
            self.dismiss()
        }.padding().background(Color.randomColor())
        
            .navigationTitle("Presented")
        
    }
}

struct FQPresentedView_Previews: PreviewProvider {
    static var previews: some View {
        FQPresentedView()
    }
}
