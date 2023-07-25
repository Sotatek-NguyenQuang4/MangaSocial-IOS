//
//  TabbarItemView.swift
//  MangaSocial
//

import UIKit
import SnapKit

class TabbarItemView: UIView {
    private let tab: TabBar
    private let normalView = UIView()
    private let imageView = UIImageView()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .medium, size: 14)
        label.textColor = R.color.mainText.callAsFunction()
        return label
    }()
    
    init(tab: TabBar) {
        self.tab = tab
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(normalView)
        normalView.addSubviews([imageView, titleLabel])
        
        normalView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(4)
        }
        titleLabel.text = tab.title
        imageView.contentMode = .scaleAspectFill
        imageView.image = tab.image?.withTintColor(.white)
    }
}
