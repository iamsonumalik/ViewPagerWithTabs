//
// Created by Sonu Malik on 24/09/17.
// Copyright (c) 2017 Sonu Malik. All rights reserved.
//

import UIKit
extension UIButton {

    func addBadge(badge : String) -> UIView{
        let sides : CGFloat = CGFloat(15);
        let view = UIView(frame: CGRect(x:self.frame.size.width - sides,y:0,width:sides,height:sides))
//        view.applyGradient(colours: [ConstantString.buttonLeft , ConstantString.buttonRight], locations: [0.5 , 1], horizontal: true )
        view.layer.cornerRadius = sides/2;
        view.clipsToBounds = true;
        let label   = UILabel(frame : view.bounds)
        label.text = badge;
        label.font = UIFont.systemFont(ofSize: 10);
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label);

        self.insertSubview(view , at : 1)
        return view;
    }
}