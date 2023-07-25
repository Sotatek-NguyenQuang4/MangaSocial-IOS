//
//  TabbarItemActiveView.swift
//  MangaSocial
//

import UIKit
import SnapKit

class TabbarItemActiveView: UIView {
    let tab: TabBar
    
    let containerView = UIView()
    
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(style: .bold, size: 14)
        label.textColor = R.color.mainOrange.callAsFunction()
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
        addSubview(containerView)
        containerView.addSubviews([imageView, titleLabel])
        
        containerView.snp.makeConstraints { make in
            make.size.equalTo(70)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(-24)
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
        
        containerView.layer.cornerRadius = 35
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = R.color.mainOrange.callAsFunction()?.cgColor
        containerView.backgroundColor = R.color.mainText.callAsFunction()
        
        titleLabel.text = tab.title
        imageView.contentMode = .scaleAspectFill
        imageView.image = tab.image?.withTintColor(R.color.mainOrange.callAsFunction() ?? .orange)
    }
}
