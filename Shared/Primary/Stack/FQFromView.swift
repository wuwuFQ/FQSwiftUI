//
//  FQFromView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQFromView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField(
                "User name (email address)",
                text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            SecureField(
                "Password",
                text: $password
            ) {}
            .border(Color(UIColor.separator))
        } .navigationTitle("Form")
    }
}

struct FQFromView_Previews: PreviewProvider {
    static var previews: some View {
        FQFromView()
    }
}
