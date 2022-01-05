//
//  FQControllerCategory.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/24.
//

import SwiftUI
import Foundation
import UIKit

struct FQControllerCategory<T: UIViewController> : UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FQControllerCategory>) -> UIViewController {
        return T()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<FQControllerCategory>) {

    }
    func dismantleUIViewController(_ uiViewController: UIViewController, coordinator: ()) {
        
    }
}

struct FQUIViewCategory<T: UIView> : UIViewRepresentable {
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<FQUIViewCategory>) -> UIView {
        return T()
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<FQUIViewCategory>) {
        
    }
}
