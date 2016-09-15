//
//  TripViewController.swift
//  TripCard
//
//  Created by Simon Ng on 8/3/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class TripViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,BabyCollectionCellDelegate{
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet var collectionView:UICollectionView!
    
    
    
    private var babys = [
        Baby(tripId: "Paris001", city: "Paris", country: "France", featuredImage: UIImage(named: "paris"), price: 2000, totalDays: 5, isLiked: false),
        Baby(tripId: "Rome001", city: "Rome", country: "Italy", featuredImage: UIImage(named: "rome"), price: 800, totalDays: 3, isLiked: false),
        Baby(tripId: "Istanbul001", city: "Istanbul", country: "Turkey", featuredImage: UIImage(named: "istanbul"), price: 2200, totalDays: 10, isLiked: false),
        Baby(tripId: "London001", city: "London", country: "United Kingdom", featuredImage: UIImage(named: "london"), price: 3000, totalDays: 4, isLiked: false),
        Baby(tripId: "Sydney001", city: "Sydney", country: "Australia", featuredImage: UIImage(named: "sydney"), price: 2500, totalDays: 8, isLiked: false),
        Baby(tripId: "Santorini001", city: "Santorini", country: "Greece", featuredImage: UIImage(named: "santorini"), price: 1800, totalDays: 7, isLiked: false),
        Baby(tripId: "NewYork001", city: "New York", country: "United States", featuredImage: UIImage(named: "newyork"), price: 900, totalDays: 3, isLiked: false),
        Baby(tripId: "Kyoto001", city: "Kyoto", country: "Japan", featuredImage: UIImage(named: "kyoto"), price: 1000, totalDays: 5, isLiked: false)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 霧化背景
        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Change the height for 3.5-inch screen
        if UIScreen.mainScreen().bounds.size.height == 480.0 {
            let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSizeMake(250.0, 300.0)
        }
        
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - CollectionView Delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return babys.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BabyCollectionCell
        
        let baby = babys[indexPath.item]
        
        cell.baby = baby
        
        cell.delegate = self
        
        // Apply round corner
        cell.layer.cornerRadius = 4.0
        
        return cell
        
    }
    
    
    // MARK: - TripCollectionCellDelegate Methods
    func didLikeButtonPressed(cell: BabyCollectionCell) {
        
        if let indexPath = collectionView.indexPathForCell(cell) {
            babys[indexPath.row].isLiked = babys[indexPath.row].isLiked ? false : true
            cell.isLiked = babys[indexPath.row].isLiked
        }
    }
}
