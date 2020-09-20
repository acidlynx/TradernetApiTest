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
    let tickerIDLabel = UILabel()
    let stockNameLabel = UILabel()
    let tickerChangesLabel = UILabel()
    let tickerTradesLabel = UILabel()
    
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
            $0.size.equalTo(30)
        }
        
        tickerIDLabel.snp.makeConstraints { [weak logoImageView] (make) in
            guard let logoImageView = logoImageView else { return }
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(logoImageView.snp.right).offset(10)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
    }
}
