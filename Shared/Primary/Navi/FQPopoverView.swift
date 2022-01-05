//
//  FQPopoverView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/21.
//

import SwiftUI

struct FQPopoverView: View {
    @State var popover = false
    var body: some View {
        Button {
            withAnimation(.spring()) {
                self.popover.toggle()
            }
        } label: {
            Text("Popover").foregroundColor(.randomColor())
        }.popover(isPresented: $popover, content: {
            FQPopoverView()
        })
        
        .navigationTitle("Popover")
        
    }
}

struct FQPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        FQPopoverView()
    }
}
