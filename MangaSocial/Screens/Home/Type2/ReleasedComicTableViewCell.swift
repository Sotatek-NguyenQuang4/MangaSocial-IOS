//
//  ReleasedComicTableViewCell.swift
//  MangaSocial
//
//  Created by Diem Tran on 04/08/2023.
//

import UIKit
import Combine

class ReleasedComicTableViewCell: UITableViewCell {
    var disposeBag = Set<AnyCancellable>()

    var data: [SwordplayModel] = []
    
    @IBOutlet weak var serverButton: UIButton!
    @IBOutlet weak var categoryAnimeLabel: UILabel!
    @IBOutlet weak var myCollectionReleasedComic: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        myCollectionReleasedComic.dataSource = self
        myCollectionReleasedComic.delegate = self
        myCollectionReleasedComic.register(.init(nibName: "ReleasedComicCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "ReleasedComicCollectionViewCell")
        myCollectionReleasedComic.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func typeAnimeCell(model: HomeModel) {
        categoryAnimeLabel.text = model.name
    }
    
    public func releasedComic(data2: [SwordplayModel]) {
        self.data = data2
        
        var numberRow: Int = 0
        if data2.count % 3 == 0 {
            numberRow = data2.count / 3
        } else {
            numberRow = data2.count / 3 + 1
        }
        
        let widthItem = (UIScreen.main.bounds.width - 16.0 - 16.0) / 3.0
        let heightItem = widthItem * 240 / 119
        
        collectionHeight.constant = heightItem * CGFloat(numberRow)
        myCollectionReleasedComic.reloadData()        
    }
}
extension ReleasedComicTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReleasedComicCollectionViewCell", 
                                                            for: indexPath) as? ReleasedComicCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell1(model: data[indexPath.row])
        return cell
    }
}
extension ReleasedComicTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16.0 - 16.0) / 3.0
        let height = width * 240 / 119
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, 
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, 
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
