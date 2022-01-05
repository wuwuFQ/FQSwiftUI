//
//  FQAsyncImageView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/23.
//

import SwiftUI

struct FQAsyncImageView: View {
    var body: some View {
             AsyncImage(url: URL(string: "https://pics2.baidu.com/feed/9a504fc2d56285351c97db3cda367ec0a6ef6393.jpeg?token=5556f1667a88f60cc67541ee6c47924b&s=275832DD6231739C36945C370300E064")) { phase in
                 if let image = phase.image {
                     image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 400, height: 400)

                     // Displays the loaded image.
                 } else if phase.error != nil {
                     Color.red // Indicates an error.
                 } else {
                     Color.blue // Acts as a placeholder.
                 }
             }
             .navigationTitle("异步加载图片")
    }
}

struct FQAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        FQAsyncImageView()
    }
}
