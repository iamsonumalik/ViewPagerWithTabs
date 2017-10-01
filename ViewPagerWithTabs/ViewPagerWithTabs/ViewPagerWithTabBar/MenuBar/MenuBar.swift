//
// Created by Sonu Malik on 01/10/17.
// Copyright (c) 2017 yodevelopers. All rights reserved.
//

import UIKit
class MenuBar : UIView{

    var viewPagerController : ViewPagerController?
    let cellId = "cellID"
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout);
        cv.delegate = self;
        cv.dataSource = self;
        return cv;
    }()
    
    let horizontalBar : UIView = {
        let v = UIView();
        v.backgroundColor = .green
        return v;
    }();
    
    var  horizontalBarLeftConstraint : NSLayoutConstraint?
    override init(frame : CGRect){
        super.init(frame: frame)
        self.collectionView.backgroundColor = .white
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId);
        addSubview(collectionView)
        collectionView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,
                topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0);
        
        // Separator
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false;
       
        addSubview(horizontalBar);
        
        horizontalBarLeftConstraint = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftConstraint?.isActive = true;
        horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor , multiplier : 1/4).isActive = true;
        horizontalBar.heightAnchor.constraint(equalToConstant: 8).isActive = true;
}

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MenuBar  : UICollectionViewDelegate , UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewPagerController?.viewControllers.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:cellId, for: indexPath) as! MenuCell
        cell.label.text = viewPagerController?.viewControllers[indexPath.row].title
        return  cell;
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewPagerController?.scrollToIndex(index : indexPath.row)
    }
}
extension MenuBar : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.frame.width / CGFloat((viewPagerController?.viewControllers.count)!), height: frame.height);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
}
