//
//  UserView.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation
import UIKit

class UserView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        tableView.register(UINib(nibName: "UserViewCellView", bundle: nil), forCellReuseIdentifier: "UserViewCellView")
        tableView.delegate = self
        tableView.dataSource = self
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.userDidSet = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.request()
    }
    
}

extension UserView: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userViewCellModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCellView", for: indexPath) as! UserViewCellView
        cell.nameLable.text = viewModel.userViewCellModels?[indexPath.row].title
        cell.descriptionLable.text = viewModel.userViewCellModels?[indexPath.row].description
        
        return cell
    }
    
}
