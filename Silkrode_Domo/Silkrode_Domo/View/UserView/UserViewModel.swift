//
//  UserViewModel.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation


class UserViewModel {
    
    var userViewCellModels: [UserViewCellViewModel]? {
        didSet {
            if let _userDidSet = userDidSet {
                _userDidSet()
            }
        }
    }
    
    var userDidSet: (() -> Void)?
   
    
    func request() {
        guard let url = URL(string: "https://api.github.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            do {
                let userModels = try JSONDecoder().decode([User].self, from: data)
                
                var users = [UserViewCellViewModel]()
                for user in userModels {
                    let _user = UserViewCellViewModel(title: user.login, description: user.type, imageUrlString: user.avatar_url)
                    users.append(_user)
                }
                self.userViewCellModels = users
                
            }catch {
                self.userViewCellModels = nil
            }
        }
        task.resume()
    }
    
    func cellDidSelect(index:Int) {
        
    }
    
}
