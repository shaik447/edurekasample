//
//  Tweet.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/19/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Tweet {
    
    var user:User
    var messageText:String
    
    init(json:JSON) {
        let userjson = json["user"]
        self.user = User(json: userjson)
        self.messageText = json["message"].stringValue
    }
    
}
