//
//  FQStepperView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI

struct FQStepperView: View {
    @State var value = 0
    var body: some View {
        HStack {
            Stepper(value: $value, step: 2, onEditingChanged: { c in
                print(c)
            }) {
                Text("Stepper Value: \(self.value)")
            }.padding(50)
        }
        .navigationTitle("Stepper")
    }
}

struct FQStepperView_Previews: PreviewProvider {
    static var previews: some View {
        FQStepperView()
    }
}
