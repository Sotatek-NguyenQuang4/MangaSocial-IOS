//
//  HomeViewController.swift
//  MangaSocial
//

import UIKit

class HomeViewController: UIViewController {
    var data1: [HomeModel] = []
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(.init(nibName: "SwordplayTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "SwordplayTableViewCell")
        myTable.register(.init(nibName: "ReleasedComicTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "ReleasedComicTableViewCell")
        
        showCustomeIndicator()
        HomeAPI.shared.getHome { [weak self] resuslt in
            guard let self = self else { return }
            hideCustomeIndicator()
            switch resuslt {
            case .success(let success):
                self.data1 = success.filter { $0.type != 3 }
                self.myTable.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        AppConstant.logout()
        self.navigationController?.setRootViewController(viewController: LoginViewController(),
                                                         controllerType: LoginViewController.self)
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        data1.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data1[indexPath.row].type {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwordplayTableViewCell",
                                                           for: indexPath) as? SwordplayTableViewCell else {
                return UITableViewCell()
            }
            cell.swordplay(data: data1[indexPath.row].data)
    
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReleasedComicTableViewCell",
                                                           for: indexPath) as? ReleasedComicTableViewCell else {
                return UITableViewCell()
            }
            cell.releasedComic(data2: data1[indexPath.row].data)
            cell.typeAnimeCell(model: data1[indexPath.row])
            return cell
        
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
