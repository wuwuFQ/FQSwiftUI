//
//  FQWebImageView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import SwiftUI

struct FQWebImageView: View {
    
    @State private var uiImage: UIImage? = nil
    let placeholderImage = UIImage(named: "image03")!
    
    var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .scaledToFit()
            .onAppear(perform: downloadWebImage)
            .onTapGesture {
                print("Tap ")
        }.navigationTitle(Text("WebImage"))
    }
    
    func downloadWebImage() {
        
        guard let url = URL(string: "https://pics2.baidu.com/feed/9a504fc2d56285351c97db3cda367ec0a6ef6393.jpeg?token=5556f1667a88f60cc67541ee6c47924b&s=275832DD6231739C36945C370300E064") else {
            print("Invalid URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            }else {
                print("error: \(String(describing: error))")
            }
        }.resume()
    }
}

struct FQWebImageView_Previews: PreviewProvider {
    static var previews: some View {
        FQWebImageView()
    }
}
