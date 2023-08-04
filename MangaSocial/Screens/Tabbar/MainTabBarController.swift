//
//  MainTabBarController.swift
//  Mastodon
//
//  Created by Cirno MainasuK on 2021-1-27.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {

    let tabbarView = UIView()
    let contentTabbarView = UIStackView()
    var _viewControllers: [UIViewController] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let window = UIApplication.shared.mainKeyWindow else { return }
        let newHeight = 75 + window.safeAreaInsets.bottom
        tabBar.frame.size.height = newHeight
        tabBar.frame.origin.y = view.frame.height - newHeight
    }
}

extension MainTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .clear
        tabbarView.backgroundColor = R.color.mainOrange.callAsFunction()
        
        tabBar.addSubviews(tabbarView)
        tabbarView.addSubviews(contentTabbarView)
        
        tabbarView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.trailing.leading.bottom.equalToSuperview()
        }
        contentTabbarView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        let viewControllers: [UIViewController] = TabBar.allCases.map { tab in
            let viewController = UINavigationController(rootViewController: tab.viewController)
            viewController.tabBarItem.tag = tab.tag
            return viewController
        }
        
        _viewControllers = viewControllers
        setViewControllers(viewControllers, animated: false)
        
        selectedIndex = 0
        buildMainTabbar(currentTab: 0)
    }
    
    func buildMainTabbar(currentTab: Int) {
        let spec = StackSpec(axis: .horizontal,
                             distribution: .fillEqually)
        TabBar.allCases.enumerated().forEach { index, tab in
            let normalView = TabbarItemView(tab: tab)
            let selectedView = TabbarItemActiveView(tab: tab)
            let view = index == currentTab ? selectedView : normalView
            spec.add(view)
        }
        contentTabbarView.reload(with: spec)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let tab = TabBar(rawValue: viewController.tabBarItem.tag) {
            buildMainTabbar(currentTab: tab.rawValue)
        }
    }
}

extension MainTabBarController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, 
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}

enum TabBar: Int, CaseIterable {
    case home = 0
    case news = 1
    case genres = 2
    case profile = 3

    var tag: Int {
        return rawValue
    }
    
    var title: String {
        switch self {
        case .home:     return "Home"
        case .news:     return "News"
        case .genres:   return "Genres"
        case .profile:  return "Profile"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            return viewController
        case .news:
            let viewController = NewsViewController(nibName: "NewsViewController", bundle: nil)
            return viewController
        case .genres:
            let viewController = GenresViewController(nibName: "GenresViewController", bundle: nil)
            return viewController
        case .profile:
            let viewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
            return viewController
        }
    }

    var image: UIImage? {
        switch self {
        case .home:             return R.image.icoTabbarHome.callAsFunction()
        case .news:             return R.image.icoTabbarNews.callAsFunction()
        case .genres:           return R.image.icoTabbarGenres.callAsFunction()
        case .profile:          return R.image.icoTabbarProfile.callAsFunction()
        }
    }
    
    var selectedImage: UIImage? {
        return image?.withTintColor(R.color.mainText.callAsFunction() ?? .white, renderingMode: .alwaysOriginal)
    }
}
