//
//  MainTableCell.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/26.
//

import Foundation
import UIKit

class MainTableCell: UITableViewCell {
    lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    lazy var subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    lazy var dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
// MARK: - init()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLayout()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension
extension MainTableCell {
    private func setupLayout() {
        addSubviews([titleLabel, subTitleLabel, dateLabel])
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(10)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
