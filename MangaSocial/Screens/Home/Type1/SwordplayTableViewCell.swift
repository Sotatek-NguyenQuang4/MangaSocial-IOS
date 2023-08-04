//
//  SwordplayTableViewCell.swift
//  MangaSocial
//
//  Created by Diem Tran on 03/08/2023.
//

import UIKit
import UPCarouselFlowLayout

class SwordplayTableViewCell: UITableViewCell {
    var data: [SwordplayModel] = []

    @IBOutlet weak var myCollectionViewSwordplay: UICollectionView!
    @IBOutlet weak var flowLayout: UPCarouselFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        myCollectionViewSwordplay.dataSource = self
        myCollectionViewSwordplay.delegate = self
        myCollectionViewSwordplay.register(.init(nibName: "SwordplayCollectionViewCell", bundle: nil),
                                           forCellWithReuseIdentifier: "SwordplayCollectionViewCell")
        
        flowLayout.sideItemScale = 0.9
        flowLayout.sideItemAlpha = 0.8
        flowLayout.itemSize = .init(width: 188, height: 240)
        flowLayout.spacingMode = .fixed(spacing: 4)
    }
    
    public func swordplay(data: [SwordplayModel]) {
        self.data = data
        myCollectionViewSwordplay.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let centerIndexPath = IndexPath(row: Int(data.count / 2), section: 0)
            self.myCollectionViewSwordplay.scrollToItem(at: centerIndexPath,
                                                        at: .centeredHorizontally,
                                                        animated: false)
        })

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension SwordplayTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwordplayCollectionViewCell",
                                                            for: indexPath) as? SwordplayCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        return cell
    }
}

extension SwordplayTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = collectionView.frame.height
//        let width = height * 188 / 240
//        return CGSize(width: width, height: height)
//
//    }
}
