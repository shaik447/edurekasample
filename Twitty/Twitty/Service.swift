//
//  Service.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/22/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON


struct Service {
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHomefeed(completion: @escaping (HomeFeed?,Error?) -> ()){
        let request: APIRequest<HomeFeed,JsonError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homefeed) in
            completion(homefeed,nil)
        }) { (err) in
            completion(nil,err)
        }
    }
    
    func dowloadImage(imageUrl:String,completion: @escaping (UIImage) -> ()) {
        if let url = URL(string: imageUrl){
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                if let err=err {
                    print(err)
                    return
                }
                
                if let datax=data{
                    let profileimg = UIImage(data: datax)
                    completion(profileimg!)
                }
            }.resume()
        }
    }
}

class HomeFeed: JSONDecodable{
    var users = [User]()
    var tweets = [Tweet]()
    
    required init(json: JSON) throws {
        //print("The returned json \(json)")
        let userArray = json["users"].array
        if let jsonusers = userArray{
//            self.users = jsonusers.map({ (jsonuser) -> User in
//                return User(json: jsonuser)
//            })
            self.users = jsonusers.map({User(json:$0)})
        }
        let tweetArray = json["tweets"].arrayValue
        self.tweets = tweetArray.map({Tweet(json:$0)})
    }
}

class JsonError: JSONDecodable{
    required init(json: JSON) throws {
        print("The returned error is \(json)")
    }
}

class RemoteImage: JSONDecodable {
    required init(json: JSON) throws {
        print("image json",json)
    }
}

