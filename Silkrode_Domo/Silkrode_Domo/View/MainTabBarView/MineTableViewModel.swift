//
//  MineTableViewModel.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation
import UIKit

struct MineTableViewModel {
    
    private var userView:UIViewController = {
        let vc = UserView()
        vc.title = "User"
        return vc
    }()
    private var mineView:UIViewController = {
        let vc = MineView()
        vc.title = "Mine"
        return vc
    }()
        
    lazy var viewControlls:[UIViewController] = [userView,mineView]
}
