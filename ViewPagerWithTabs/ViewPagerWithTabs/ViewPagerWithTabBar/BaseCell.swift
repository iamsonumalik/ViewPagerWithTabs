//
// Created by Sonu Malik on 01/10/17.
// Copyright (c) 2017 yodevelopers. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell {

     override init(frame: CGRect) {
        super.init(frame  : frame)
        setUpView();
    }
    
    required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){

    }
}
