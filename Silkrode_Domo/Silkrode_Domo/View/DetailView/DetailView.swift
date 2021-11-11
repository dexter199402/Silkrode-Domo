//
//  DetailView.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation
import UIKit

protocol DetailViewDataSource {
    func getName(name:String,imageUrl:String)
}

class DetailView: UIViewController,DetailViewDataSource {
    
    @IBOutlet weak var photoImageView: CustomImageView!
    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var viewModel: DetailViewModel?
    
    func getName(name: String,imageUrl:String) {
        viewModel = DetailViewModel(account: name,imageUrl: imageUrl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        guard let _viewModel = viewModel else {
            return
        }
        _viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.photoImageView.loadImageUsingUrlString(urlString: _viewModel.imageUrl)
                self?.lable1.text = _viewModel.name
                self?.label2.text = _viewModel.location
                self?.label3.text = _viewModel.email
            }
        }
        _viewModel.request()
    }
}
