//
//  PhoneImageCollectionViewCell.swift
//  Phones
//
//  Created by Mirjalol Bahodirov on 6/5/18.
//  Copyright © 2018 mirjalol. All rights reserved.
//

import UIKit

class PhoneImageCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        
        imageView.image = nil
    }
    
}
