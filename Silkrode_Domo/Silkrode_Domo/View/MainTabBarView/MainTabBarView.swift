//
//  MainTabBarView.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation
import UIKit

class MainTabBarView: UITabBarController {
    
    var viewModel = MineTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setViewControllers(viewModel.viewControlls, animated: false)
    }
}
