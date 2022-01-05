//
//  FQPickerView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQPickerView: View {
    
    @State var index_1 = 0
    @State var index_2 = 0
    @State var index_3 = 0
    @State var index_4 = 0

    let source_1 = (0..<10).map { $0%2 == 0 ? "🐝segmented\($0)":"🦋segmented\($0)" }
    let source_2 = (0..<10).map { $0%2 == 0 ? "🐝inline\($0)":"🦋inline\($0)" }
    let source_3 = (0..<10).map { $0%2 == 0 ? "🐝wheel\($0)":"🦋wheel\($0)" }
    let source_4 = (0..<10).map { $0%2 == 0 ? "🐝menu\($0)":"🦋menu\($0)" }

    var body: some View {
        ScrollView {
            VStack {
                Text("segmented:")
                Text("\(self.source_1[self.index_1])")
                    .foregroundColor(.orange)
                    .bold()
                    .font(.largeTitle)
                
                Picker("segmented", selection: $index_1) {
                    ForEach(0..<source_1.count) {
                        Text(self.source_1[$0]).tag($0)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: UIScreen.main.bounds.width/2)
            }
            
            VStack {
                Text("inline:")
                Text("\(self.source_2[self.index_2])")
                    .foregroundColor(.orange)
                    .bold()
                    .font(.largeTitle)
                
                Picker("inline", selection: $index_2) {
                    ForEach(0..<source_2.count) {
                        Text(self.source_2[$0]).tag($0)
                    }
                }
                .pickerStyle(.inline)
                .frame(width: UIScreen.main.bounds.width/2)
            }
        
            VStack {
                Text("wheel:")
                Text("\(self.source_3[self.index_3])")
                    .foregroundColor(.orange)
                    .bold()
                    .font(.largeTitle)
                
                Picker("wheel", selection: $index_3) {
                    ForEach(0..<source_3.count) {
                        Text(self.source_3[$0]).tag($0)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: UIScreen.main.bounds.width/2)
            }
            VStack {
                Text("menu:")
                Text("\(self.source_4[self.index_4])")
                    .foregroundColor(.orange)
                    .bold()
                    .font(.largeTitle)
                
                Picker("menu", selection: $index_4) {
                    ForEach(0..<source_4.count) {
                        Text(self.source_4[$0]).tag($0)
                    }
                }
                .pickerStyle(.menu)
                .frame(width: UIScreen.main.bounds.width/2)
            }
            Divider()
        }
        .padding(10)
        .navigationTitle("Picker")
    }
}

struct FQPickerView_Previews: PreviewProvider {
    static var previews: some View {
        FQPickerView()
    }
}
