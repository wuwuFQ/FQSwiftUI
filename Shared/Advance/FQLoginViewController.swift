//
//  FQLoginViewController.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/27.
//

import UIKit
import SwiftUI

class FQLoginViewController: UIViewController {
    private var loginBtn: UIButton = {
        let _loginBtn = UIButton(type: .custom)
        _loginBtn.frame = CGRect(x: 60, y: 240, width: 140, height: 30)
        _loginBtn.backgroundColor = .cyan
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.setTitle("有账号,去登录", for: .normal)
        _loginBtn.setTitleColor(.black, for: .normal)
        return _loginBtn
    }()
    private var registBtn: UIButton = {
        let _registBtn = UIButton(type: .custom)
        _registBtn.frame = CGRect(x: 240, y: 240, width: 120, height: 30)
        _registBtn.backgroundColor = .orange
        _registBtn.layer.cornerRadius = 5;
        _registBtn.setTitle("注册新账号", for: .normal)
        _registBtn.setTitleColor(.red, for: .normal)
        return _registBtn
    }()

    private var openBtn: UIButton = {
        let _openBtn = UIButton(type: .custom)
        _openBtn.frame = CGRect(x: 100, y: 300, width: 200, height: 40)
        _openBtn.backgroundColor = .systemPink
        _openBtn.layer.cornerRadius = 20;
        _openBtn.setTitle("打开SwiftUI页面", for: .normal)
        _openBtn.setTitleColor(.blue, for: .normal)
        _openBtn.addTarget(self, action: #selector(openSwiftUI), for: .touchUpInside)
        return _openBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: view.bounds.size.width - 100, height: 30))
        label.textAlignment = .center
        label.text = "使用Swift语言编写的页面"
        self.view.addSubview(label)
        self.view.addSubview(loginBtn)
        self.view.addSubview(registBtn)
        self.view.addSubview(openBtn)
    }
    
    @objc func openSwiftUI() {
        let vc = UIHostingController(rootView: FQScrollView())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
