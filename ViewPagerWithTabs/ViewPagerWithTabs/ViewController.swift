//
//  ViewController.swift
//  ViewPagerWithTabs
//
//  Created by Sonu Malik on 01/10/17.
//  Copyright © 2017 yodevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let child1 = Tab1ViewController.init(nibName: nil, bundle: nil)
        child1.view.backgroundColor = UIColor.black
        let child2 = Tab1ViewController.init(nibName: nil, bundle: nil)
        child2.view.backgroundColor = UIColor.red
        let child3 = Tab1ViewController.init(nibName: nil, bundle: nil)
        child3.view.backgroundColor = UIColor.purple
        let child4 = Tab1ViewController.init(nibName: nil, bundle: nil)
        child4.view.backgroundColor = UIColor.cyan

        child1.title  = "Child 1"
        child2.title  = "Child 2"
        child3.title  = "Child 3"
        child4.title  = "Child 4"
        let viewPager = ViewPagerController.init(viewControllers: [child1,child2,child3,child4]);
        self.view.addSubview(viewPager.view)
        viewPager.view.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
