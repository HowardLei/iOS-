//
//  NavigationController.swift
//  CustomNavigationControllerPop
//
//  Created by apple on 2019/5/31.
//  Copyright © 2019 ITCenter. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        // 注意：如果判断的逻辑需要涉及到别的控制器，需要在别的控制器当中添加一个方法（涉及到导航控制器能否弹出的判断），然后检测 topViewController 是不是有该方法的实现。有的话执行该方法即可。
        //  在这个样例当中只需要判断你的 topViewController 是不是第二个控制器即可。
        if topViewController?.isMember(of: SecondController.self) ?? false {
            let alertController = UIAlertController(title: "你点击返回了", message: "请问需要返回上一个控制器 吗？", preferredStyle: .alert)
            let backAction = UIAlertAction(title: "返回", style: .default) { action in
                self.popViewController(animated: true)
                // 由于这个方法只是控制导航栏上边的动画移动，而最后的返回值是 false，所以说还需要将控制栏重新隐藏显示一遍才能弹出正确的导航栏。
                self.isNavigationBarHidden = true
                self.setNavigationBarHidden(false, animated: true)
            }
            let stayAction = UIAlertAction(title: "不返回", style: .cancel, handler: nil)
            alertController.addAction(backAction)
            alertController.addAction(stayAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
}
