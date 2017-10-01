//
// Created by Sonu Malik on 01/10/17.
// Copyright (c) 2017 yodevelopers. All rights reserved.
//

import UIKit

class MenuCell : BaseCell {

    let label : UILabel = {
        let l = UILabel();
        l.textColor = .black
        l.textAlignment = .center
        return l
    }();
    override func setUpView() {
        super.setUpView()
        addSubview(label);
        label.fillSuperview();
    }
    
}
