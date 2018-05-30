//
//  User.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/15/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

struct User{
    var Name:String!
    var UserName:String!
    var BioText:String!
    var ProfileImage:UIImage!
    var ProfileImgUrl:String!
    
    init(json : JSON) {
        self.Name = json["name"].stringValue
        self.UserName = json["username"].stringValue
        self.BioText = json["bio"].stringValue
        self.ProfileImage = #imageLiteral(resourceName: "profilepic")
        self.ProfileImgUrl = json["profileImageUrl"].stringValue
    }
}
