//
//  ReleasedComicTableViewCell.swift
//  MangaSocial
//
//  Created by Diem Tran on 04/08/2023.
//

import UIKit

class ReleasedComicTableViewCell: UITableViewCell {
    
    var data: [SwordplayModel] = []
    
    @IBOutlet weak var serverButton: UIButton!
    @IBOutlet weak var categoryAnimeLabel: UILabel!
    @IBOutlet weak var myCollectionReleasedComic: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionReleasedComic.dataSource = self
        myCollectionReleasedComic.delegate = self
        myCollectionReleasedComic.register(.init(nibName: "ReleasedComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReleasedComicCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    func typeAnimeCell(model: HomeModel) {
        categoryAnimeLabel.text = model.name
    }
    public func releasedComic(data2: [SwordplayModel]) {
        self.data = data2
        myCollectionReleasedComic.reloadData()
    }
}
extension ReleasedComicTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReleasedComicCollectionViewCell", for: indexPath) as? ReleasedComicCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell1(model: data[indexPath.row])
        return cell
    }
}
extension ReleasedComicTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 240
        let width = 119
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}
