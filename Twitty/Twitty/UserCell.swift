//
//  WorldCell.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/12/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

let twitterColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)

class UserCell: UICollectionViewCell {
    
    var user:User!{
        didSet{
            nameLabel.text=user.Name
            usernameLabel.text=user.UserName
            bioLabel.text=user.BioText
            Service.sharedInstance.dowloadImage(imageUrl: user.ProfileImgUrl) { remoteimage in
                DispatchQueue.main.async {
                    self.profileImage.image = remoteimage
                }
                
            }
        
        }
    }
    
    var nameLabel:UILabel={
        let uilabel=UILabel()
        uilabel.text="Shaik Shavali"
        uilabel.font=UIFont.boldSystemFont(ofSize: 16)
        return uilabel
    }()
    
    
    var profileImage:UIImageView={
        let proImage=UIImageView()
        proImage.image=#imageLiteral(resourceName: "profilepic")
        proImage.layer.cornerRadius=5
        proImage.clipsToBounds=true
        return proImage
    }()
    
    var usernameLabel:UILabel={
        let userlabel=UILabel()
        userlabel.text="@shaik447"
        userlabel.font=UIFont.systemFont(ofSize: 14)
        userlabel.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        return userlabel
    }()
    
    var bioLabel:UITextView={
        let biolbl=UITextView()
        biolbl.text = "This is the programming language guide and you will learn swift ios development and animations"
        biolbl.font = UIFont.systemFont(ofSize: 15)
        biolbl.backgroundColor = .clear
        //biolbl.isScrollEnabled = false
        return biolbl
    }()
    
    var followUpBtn:UIButton={
        
        var fllowBtn=UIButton()
        fllowBtn.setTitle("Follow", for: UIControlState.normal)
        fllowBtn.titleLabel?.textColor=twitterColor
        fllowBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        fllowBtn.layer.borderColor = twitterColor.cgColor
        fllowBtn.layer.cornerRadius = 5
        fllowBtn.layer.borderWidth = 1
        fllowBtn.setImage(#imageLiteral(resourceName: "follow"), for: UIControlState.normal)
        fllowBtn.setTitleColor(twitterColor, for: .normal)
        fllowBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        fllowBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        
        
        return fllowBtn
    }()
    
    var seperator:UIView={
        let uiview=UIView()
        uiview.backgroundColor = UIColor.lightGray
        return uiview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .yellow
        SetupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetupViews() {
        backgroundColor = .white
        //layer.cornerRadius = 10
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioLabel)
        addSubview(followUpBtn)
        addSubview(seperator)
        
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(self.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followUpBtn.leftAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: -4, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioLabel.anchor(usernameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: -3, rightConstant: -12, widthConstant: 0, heightConstant: 0)
        
        followUpBtn.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: -12, widthConstant: 120, heightConstant: 30)
        
        seperator.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: -12, widthConstant: 0, heightConstant: 1.2)
   
        
    }
    
    
}
