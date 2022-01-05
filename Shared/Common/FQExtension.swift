//
//  FQExtension.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/20.
//

import Foundation
import SwiftUI


extension Double {
    /// 随机数0···1
    static func random() -> Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
}

extension Color {
    /// 随机色
    static func randomColor() -> Color {
        return Color(red: .random(), green: .random(), blue: .random())
    }
}
