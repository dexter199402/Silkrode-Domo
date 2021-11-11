//
//  UserViewCellView.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation
import UIKit

class UserViewCellView: UITableViewCell {
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    private func commonInit()  {
        
    }
    
}
