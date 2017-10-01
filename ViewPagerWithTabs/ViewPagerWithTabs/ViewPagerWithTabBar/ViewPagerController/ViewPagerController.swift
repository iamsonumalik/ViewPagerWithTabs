//
//  ViewPagerController.swift
//  ViewPagerWithTabs
//
//  Created by Sonu Malik on 01/10/17.
//  Copyright © 2017 yodevelopers. All rights reserved.
//

import UIKit
class ViewPagerController: UIViewController {
    var currentPosition = 0;
    let cellId = "cellId";
    var colors : [UIColor] = [UIColor.black , UIColor.red , UIColor.purple , UIColor.cyan]
    var heightOfMenuBar : CGFloat = 50;
    var viewControllers  = [UIViewController]();
    lazy var  menuBar : MenuBar = {
        let mb  = MenuBar()
        mb.viewPagerController = self;
        return mb;
    }();
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height - heightOfMenuBar)
        layout.minimumLineSpacing = 0
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout);
        cv.delegate = self;
        cv.dataSource = self;
        cv.isPagingEnabled = true
    
        return cv;
    }()
    
    init(viewControllers  : [UIViewController]) {
        self.viewControllers = viewControllers;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        // set HeaderMenu
        self.view.addSubview(menuBar);
        menuBar.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor,
                       topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: heightOfMenuBar);
        
        // set CollectionView
        collectionView.register(ViewPagerCell.self, forCellWithReuseIdentifier: cellId);
        self.view.addSubview(collectionView);
        collectionView.anchor(menuBar.bottomAnchor, left: menuBar.leftAnchor, bottom: self.view.bottomAnchor, right: menuBar.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0);
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftConstraint?.constant = CGFloat(scrollView.contentOffset.x) / CGFloat(viewControllers.count)
    }
    
    func scrollToIndex(index : Int){
        let indexPath  = IndexPath.init(row: index, section: 0);
        collectionView.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        currentPosition = Int(targetContentOffset.move().x / self.view.frame.width);
        print(currentPosition)
    }
    
}

extension ViewPagerController : UICollectionViewDelegate , UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ViewPagerCell
        let indexView  = viewControllers[indexPath.row].view!;
        cell.addSubview(indexView)
        indexView.anchor(cell.topAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0);
        return cell;
    }
}
