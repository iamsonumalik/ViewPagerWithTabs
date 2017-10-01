//
// Created by Sonu Malik on 24/09/17.
// Copyright (c) 2017 Sonu Malik. All rights reserved.
//

import UIKit

extension UIImageView {
    func setTintColor( color : UIColor){
        self.image = self.image?.withRenderingMode(.alwaysTemplate);
        self.tintColor = color;
    }
}
