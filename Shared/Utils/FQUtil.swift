//
//  FQUtil.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/27.
//

import Foundation
import UIKit

var FQScreenSize: CGSize {
#if os(iOS) || os(tvOS)
    return UIScreen.main.bounds.size
#elseif os(watchOS)
    return WKInterfaceDevice.current().screenBounds.size
#else
    return NSScreen.main?.frame.size ?? .zero
#endif
}

var FQScreenWidth: CGFloat {
    FQScreenSize.width
}

var FQScreenHeight: CGFloat {
    FQScreenSize.height
}

var FQKeyWindow: UIWindow? {
    UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first ?? nil
}

var FQCurrentController: UIViewController? {
    getCurrentController(topVC: nil)
}

private func getCurrentController(topVC: UIViewController? = FQKeyWindow?.rootViewController) -> UIViewController? {
    if let nav = topVC as? UINavigationController {
        return getCurrentController(topVC: nav.visibleViewController)
    }
    if let tab = topVC as? UITabBarController {
        return getCurrentController(topVC: tab.selectedViewController)
    }
    if let presented = topVC?.presentedViewController {
        return getCurrentController(topVC: presented)
    }
    if let split = topVC as? UISplitViewController{
        return getCurrentController(topVC: split.presentingViewController)
    }
    return topVC
}

class FQUtil {
    static func tabBarHidden(hidden:Bool) {
        guard let viewControllers = FQKeyWindow?.rootViewController?.children else { return }
        for vc in viewControllers {
            if vc.isKind(of: UITabBarController.self) {
                let tabBarController = vc as! UITabBarController
                tabBarController.tabBar.isHidden = hidden
            }
        }
    }
}
