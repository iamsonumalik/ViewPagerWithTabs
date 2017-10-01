//
// Created by Sonu Malik on 24/09/17.
// Copyright (c) 2017 Sonu Malik. All rights reserved.
//

import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    public func dismissKeyboard() {
        view.endEditing(true)
    }

    func toast(message : String) {

        let toast = UILabel();
        toast.text = "  \(message)  ";
        toast.backgroundColor = UIColor.init(netHex: 0x000000, alpha: 0.6);
        toast.textColor = .white;
        toast.font = .systemFont(ofSize: 14);
        self.view.addSubview(toast)
        toast.anchorCenterSuperview()


        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            toast.removeFromSuperview();
        }
    }

    func setProgress() ->  UIButton{
        let indicatorView = UIButton(frame : self.view.bounds);
        indicatorView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame.size = CGSize(width : 60 , height : 60)
        indicator.frame.origin = CGPoint(x : view.frame.size.width/2  - 30,y: view.frame.size.width/2 - 30)
        indicator.center = view.center
        indicator.startAnimating();
        indicator.color = .white
        indicatorView.addSubview(indicator)
        self.view.addSubview(indicatorView)
        return indicatorView
    }

    func wrapToContent(textView : UITextView) {
        let contentSize = textView.sizeThatFits(textView.bounds.size)
        var frame = textView.frame
        frame.size.height = contentSize.height
        frame.size.width = contentSize.width
        textView.frame = frame
        let aspectRatioTextViewConstraint = NSLayoutConstraint(item: textView, attribute: .height, relatedBy: .equal, toItem: textView, attribute: .width, multiplier: textView.bounds.height/textView.bounds.width, constant: 1)
        textView.addConstraint(aspectRatioTextViewConstraint)
    }
}


