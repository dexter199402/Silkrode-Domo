//
//  DetailViewModel.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation

class DetailViewModel {
    
    init(account:String,imageUrl:String) {
        self.account = account
        self.imageUrl = imageUrl
    }
    
    var name:String?
    var account: String
    var imageUrl: String
    var location: String?
    var email: String?
    
    var onRequestEnd: (() -> Void)?
    
    func request() {
        guard let url = URL(string: "https://api.github.com/users/\(account)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            do {
                let userModel = try JSONDecoder().decode(User_de.self, from: data)
                self.name = userModel.name
                self.location = userModel.location
                self.email = userModel.email
                self.onRequestEnd?()
            }catch {
                
            }
        }
        task.resume()
    }

}
