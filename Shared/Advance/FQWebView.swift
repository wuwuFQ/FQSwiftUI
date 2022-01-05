//
//  FQWebView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/27.
//

import Foundation
import WebKit
class FQWebView: WKWebView {
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        super.init(frame: frame, configuration: configuration)
        loadWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadWebView() {
        self.uiDelegate = self
        self.navigationDelegate = self
        self.allowsBackForwardNavigationGestures = true
        guard let url = URL.init(string: "https://www.apple.com") else {
            return
        }
        let request =  URLRequest.init(url: url)
        self.load(request)
    }
}

extension FQWebView: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo) async {
        
    }
}
