//
//  SecondController.swift
//  CustomNavigationControllerPop
//
//  Created by apple on 2019/5/31.
//  Copyright © 2019 ITCenter. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton()
        button.setTitle("点击返回", for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        let centerConstraint1 = NSLayoutConstraint(item: button, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 0)
        let centerConstraint2 = NSLayoutConstraint(item: button, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1, constant: 0)
        view.addSubview(button)
        NSLayoutConstraint.activate([centerConstraint1, centerConstraint2])
    }
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
