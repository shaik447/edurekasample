//
//  TweetCell.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/16/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class TweetCell : UICollectionViewCell{
    
    var tweet:Tweet!{
        
        didSet{
            Service.sharedInstance.dowloadImage(imageUrl: tweet.user.ProfileImgUrl) { (remoteimg) in
                DispatchQueue.main.async {
                    self.profileImage.image=remoteimg
                }
            }
            let attributedText = NSMutableAttributedString(string: tweet.user.Name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            attributedText.append(NSAttributedString(string: "  \(tweet.user.UserName!) \n", attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14) , NSForegroundColorAttributeName : UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: tweet.messageText, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 15)]))
            messageText.attributedText = attributedText
        }
        
    }
    
    var profileImage:UIImageView={
        let proImage=UIImageView()
        proImage.image=#imageLiteral(resourceName: "profilepic")
        proImage.layer.cornerRadius=5
        proImage.clipsToBounds=true
        return proImage
    }()
    
    var messageText:UITextView={
        var label=UITextView()
        label.text="SOME SAMPLE TEXT"
        label.backgroundColor = .clear
        return label
    }()
    
    var replyButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        return button
    }()
    
    var retweetButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        return button
    }()
    
    var likeButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        return button
    }()
    
    var directMsgButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        
        addSubview(profileImage)
        addSubview(messageText)
        
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageText.anchor(self.topAnchor, left: profileImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let retweetContainer = UIView()
        let replyContainer = UIView()
        let likeContainer = UIView()
        let directmsgContainer = UIView()
   
        
        let stackview = UIStackView(arrangedSubviews: [replyContainer,retweetContainer,likeContainer,directmsgContainer])
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        
        addSubview(stackview)
        stackview.anchor(nil, left: messageText.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        
        addSubview(replyButton)
        replyButton.anchor(replyContainer.topAnchor, left: replyContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(likeButton)
        likeButton.anchor(likeContainer.topAnchor, left: likeContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(retweetButton)
        retweetButton.anchor(retweetContainer.topAnchor, left: retweetContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(directMsgButton)
        directMsgButton.anchor(directmsgContainer.topAnchor, left: directmsgContainer.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
    
    
    
    
}
