//
//  PhoneTableViewCell.swift
//  Phones
//
//  Created by Mirjalol Bahodirov on 6/5/18.
//  Copyright © 2018 mirjalol. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class PhoneTableViewCell: UITableViewCell {

    var label: UILabel!
    var photoCollectionView: UICollectionView!
    
    var data: PhoneListItem! {
        didSet {
            label.text = data.title
            photoCollectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label = UILabel()
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.top.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(22)
        }
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 120, height: 120)
        
        photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(photoCollectionView)
        photoCollectionView.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(label.snp.bottom).offset(12)
            make.right.bottom.equalTo(-12)
            make.height.equalTo(120)
        }
        photoCollectionView.layer.masksToBounds = false
        photoCollectionView.backgroundColor = UIColor.white
        photoCollectionView.register(PhoneImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }

}

extension PhoneTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhoneImageCollectionViewCell
        cell.imageView.image = nil
        cell.imageView.af_setImage(withURL: URL(string: data.images![indexPath.row])!, runImageTransitionIfCached: true) { (response: DataResponse<UIImage>) in
            collectionView.collectionViewLayout.invalidateLayout()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PhoneImageCollectionViewCell {
            if let image = cell.imageView.image {
                let height = image.size.height
                let width = image.size.width
                
                let newWidth = width * (120/height)
                return CGSize(width: newWidth, height: 120)
            }
        }
        
        return CGSize(width: 120, height: 120)
    }
    
}
