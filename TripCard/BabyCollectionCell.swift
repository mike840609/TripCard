//
//  babyCollectionCell.swift
//  TripCard
//
//  Created by 蔡鈞 on 2016/9/15.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

protocol BabyCollectionCellDelegate {
    func didLikeButtonPressed(cell: BabyCollectionCell)
}

class BabyCollectionCell: UICollectionViewCell {
    
    var baby:Baby?{
        didSet{
            setupView()
        }
    }
    
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var cityLabel:UILabel!
    @IBOutlet var countryLabel:UILabel!
    @IBOutlet var totalDaysLabel:UILabel!
    @IBOutlet var priceLabel:UILabel!
    @IBOutlet var likeButton:UIButton!
    
    var delegate:BabyCollectionCellDelegate?
    
    
    var isLiked:Bool = false  {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(named: "heartfull"), forState: .Normal)
            } else {
                likeButton.setImage(UIImage(named: "heart"), forState: .Normal)
            }
        }
    }
    
    func setupView (){
        
        guard let baby = baby else{ return }
        
        cityLabel.text = baby.city
        countryLabel.text = baby.country
        imageView.image = baby.featuredImage
        priceLabel.text = "$\(String(baby.price))"
        totalDaysLabel.text = "\(baby.totalDays) days"
        isLiked = baby.isLiked
    }
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        delegate?.didLikeButtonPressed(self)
    }
}
