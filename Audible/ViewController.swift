//
//  ViewController.swift
//  Audible
//
//  Created by pratik gupta on 13/09/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //MARK:- Properties
    
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.backgroundColor = .white
        return cv
    }()

    let pages: [Page] = {
       
        let firstPage = Page(title: "Share a great listen", message: "it's time to send your books to the people in your life, Every receipents first book is on", imageName: "page1")
        
        let secondPage = Page(title: "Share a great listen", message: "it's time to send your books to the people in your life, Every receipents first book is on", imageName: "page2")
        
        let thirdPage = Page(title: "Share a great listen", message: "it's time to send your books to the people in your life, Every receipents first book is on", imageName: "page3")
        

        return [firstPage, secondPage, thirdPage]
    }()
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK:- delegate and datasource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
