//
//  StockTableViewCell.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 20.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import UIKit
import SnapKit

class StockTableViewCell: UITableViewCell {
    let logoImageView = UIImageView()

    let tickerIDLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textAlignment = .left
        
        return label
    }()

    let stockNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .left
        
        return label
    }()
    
    let tickerChangesLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .right
        
        return label
    }()
    
    let tickerTradesLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .right
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        makeLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension StockTableViewCell {
    func addSubviews() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(tickerIDLabel)
        contentView.addSubview(stockNameLabel)
    }
    
    func makeLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(10)
            $0.size.equalTo(20)
        }
        
        tickerIDLabel.snp.makeConstraints { [weak logoImageView] (make) in
            guard let logoImageView = logoImageView else { return }
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(logoImageView.snp.right).offset(10)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        stockNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(300)
            make.height.equalTo(20)
        }
    }
}
