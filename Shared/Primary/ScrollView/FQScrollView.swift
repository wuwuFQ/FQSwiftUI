//
//  FQScrollView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<30) {
                   Text("Row \($0)").padding()
               }
           }
        }
        ScrollView(showsIndicators: false) {
             VStack(alignment: .center) {
                 ForEach(0..<30) {
                    Text("Row \($0)").padding()
                    Divider()
                }
            }
        }
        .navigationTitle("ScrollView")
    }
}

struct FQScrollView_Previews: PreviewProvider {
    static var previews: some View {
        FQScrollView()
            
            
    }
}
