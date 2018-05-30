//
//  HomeControllerNavigationBars.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/16/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

extension HomeController{

    func setupNavBars() {
        setupRightBarItems()
        setupLeftBarButton()
        setupTitleBarButton()
    }
    
    private func setupRightBarItems(){
        let composebutton=UIButton(type: .system)
        composebutton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composebutton.frame=CGRect(x: 0, y: 0, width: 34, height: 34)
        let composeBarBtn=UIBarButtonItem(customView: composebutton)
        
        let searchbutton=UIButton(type: .system)
        searchbutton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchbutton.frame=CGRect(x: 0, y: 0, width: 34, height: 34)
        let searchBarBtn=UIBarButtonItem(customView: searchbutton)
        
        navigationItem.rightBarButtonItems=[composeBarBtn,searchBarBtn]
    }
    
    private func setupLeftBarButton(){
        let followBtn=UIButton(type: .system)
        followBtn.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followBtn.frame=CGRect(x: 0, y: 0, width: 34, height: 34)
        let followBarBtn=UIBarButtonItem(customView: followBtn)
        
        navigationItem.leftBarButtonItem=followBarBtn
    }
    
    private func setupTitleBarButton(){
        let titleBtn=UIButton(type: .system)
        titleBtn.setImage(#imageLiteral(resourceName: "title_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        titleBtn.frame=CGRect(x: 0, y: 0, width: 34, height: 34)
        titleBtn.imageView?.contentMode = .scaleAspectFit
        navigationItem.titleView=titleBtn
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }

}
