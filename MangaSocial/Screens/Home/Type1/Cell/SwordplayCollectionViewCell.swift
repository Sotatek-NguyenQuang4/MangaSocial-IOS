//
//  SwordplayCollectionViewCell.swift
//  MangaSocial
//
//  Created by Diem Tran on 03/08/2023.
//

import UIKit

class SwordplayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var chapterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(model: SwordplayModel) {
//        imageView.image = UIImage(named: model.image_poster_link_goc ?? "")
        nameLabel.text = model.title_manga
        authorLabel.text = model.id_manga
        genresLabel.text = model.time_release
        chapterLabel.text = model.chapter_new
        
//        shadowDecorate()
    }
}

extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
//        contentView.layer.cornerRadius = radius
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.clear.cgColor
//        contentView.layer.masksToBounds = true
    
        layer.shadowColor = UIColor.yellow.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}
