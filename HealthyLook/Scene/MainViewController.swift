//
//  ViewController.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/26.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit
import Alamofire

struct Info {
    var title: String
    var sub: String
    var date: String
}

let infoDummy: [Info] = [Info(title: "1", sub: "1", date: "1"),
                         Info(title: "2", sub: "2", date: "2"),
                         Info(title: "3", sub: "3", date: "3")
]

class MainViewController: UIViewController {
    let disposeBag = DisposeBag()
    let dummy = Observable.of(infoDummy.map { $0 })
    
    private lazy var tableView = UITableView().then {
        $0.register(MainTableCell.self, forCellReuseIdentifier: "MainTableCell")
        $0.rowHeight = UITableView.automaticDimension
        $0.layer.cornerRadius = 10
//        $0.backgroundColor = .purple
//        $0.estimatedRowHeight = 50
    }
    
// MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        setup()
        bindTableView()
        getTest()
        
    }
}

// MARK: - extension_function
extension MainViewController {
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubviews([tableView])
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        //        self.tableView.reloadData()
    }
    
    private func navigationSetup() {
//        let cancel = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction(handler: { _ in
//            // 들어갈 액션
//        }))
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        
        self.navigationItem.title = "일지"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let rightBtn = UIBarButtonItem(image: .init(systemName: "plus"), style: .plain, target: self, action: #selector(goAddVC))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        
    }
    
    @objc private func goAddVC() {
        self.navigationController?.pushViewController(AddViewController(), animated: true)
    }
    
    private func bindTableView() {
        dummy.bind(to: tableView.rx.items) { tableView, row, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell") as! MainTableCell
            cell.titleLabel.text = element.title
            cell.subTitleLabel.text = element.sub
            cell.dateLabel.text = element.date
            
            return cell
        }.disposed(by: disposeBag)
    }
    
    func getTest() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (json) in
                //응답처리
                print(json)
        }
    }
}
