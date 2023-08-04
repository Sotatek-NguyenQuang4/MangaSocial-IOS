//
//  ReleasedComicCollectionViewCell.swift
//  MangaSocial
//
//  Created by Diem Tran on 04/08/2023.
//

import UIKit

class ReleasedComicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageAnime: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell1(model: SwordplayModel) {
        nameLabel.text = model.title_manga
        chapterLabel.text = model.id_chapter
        rateLabel.text = model.rate
        timeLabel.text = model.time_release
        
    }
}
