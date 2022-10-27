//
//  AddViewController.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/26.
//

import Foundation
import UIKit

class AddViewController: UIViewController {
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "제목 :"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var titleTf = UITextField().then {
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 10
    }
    
    private lazy var contentView = UITextView().then {
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 10
//        $0.isScrollEnabled = false
//        $0.sizeToFit()
    }
    
    private lazy var anotherContentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var calendarLable = UILabel().then {
        $0.text = "날짜 :"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var calendarBtn = UIButton().then {
        $0.setImage(.init(systemName: "calendar.badge.plus"), for: .normal)
        $0.addTarget(self, action: #selector(popCalendar), for: .touchUpInside)
    }
    
    @objc private func popCalendar(){
        print("popCalendar clicked")
    }
    
    private lazy var locateLabel = UILabel().then {
        $0.text = "위치 :"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var locateBtn = UIButton().then {
        $0.setImage(.init(systemName: "location.square"), for: .normal)
    }
    
    private lazy var weatherLabel = UILabel().then {
        $0.text = "날씨 :"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var weatherNow = UILabel().then {
        $0.text = "맑음"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private lazy var btnView = UIView()
    
    private lazy var cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(r: 190, g: 235, b: 225)
    }
    
    private lazy var saveBtn = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(r: 190, g: 235, b: 225)
    }
    
// MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSetup()
        setup()
    }
}

// MARK: - extension_function
extension AddViewController {
    private func navigationSetup() {
        self.navigationItem.title = "일지 추가"
        let rightBtn = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(goMainVC))
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    @objc private func goMainVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubviews([titleLabel, titleTf, contentView, anotherContentView, btnView])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleTf.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(20)
            $0.width.equalTo(self.view.safeAreaLayoutGuide).inset(50)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(180)
        }
        
        anotherContentView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
//            $0.width.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(140)
        }
        
        btnView.snp.makeConstraints {
            $0.top.equalTo(anotherContentView.snp.bottom).offset(20)
//            $0.leading.equalToSuperview().inset(20)
//            $0.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(220)
            $0.height.equalTo(60)
        }
        
        anotherContentView.addSubviews([calendarLable, calendarBtn, locateLabel, locateBtn, weatherLabel, weatherNow])
        
        calendarLable.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        calendarBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(calendarLable.snp.trailing).offset(20)
            $0.width.height.equalTo(50)
        }
        
        locateLabel.snp.makeConstraints {
            $0.top.equalTo(calendarLable.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        locateBtn.snp.makeConstraints {
            $0.top.equalTo(calendarBtn.snp.bottom).offset(20)
            $0.leading.equalTo(locateLabel.snp.trailing).offset(20)
            $0.width.height.equalTo(50)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(locateLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        weatherNow.snp.makeConstraints {
            $0.top.equalTo(locateBtn.snp.bottom).offset(20)
            $0.leading.equalTo(weatherLabel.snp.trailing).offset(20)
        }
        
        btnView.addSubviews([cancelBtn, saveBtn])
        
        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        saveBtn.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(cancelBtn.snp.trailing).offset(20)
            $0.width.equalTo(100)
        }
    }
}
 
