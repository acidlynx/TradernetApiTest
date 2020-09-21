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

    /// label with ticker id
    let tickerIDLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textAlignment = .left
        
        return label
    }()

    /// label with stock's info
    let stockNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .left
        
        return label
    }()
    
    /// label with ticker changes
    let tickerChangesLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    /// label with last trade info
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
    
    /// setup label with
    private func setupTickerChanges(with number: NSNumber, growType: ComparisonResult = .orderedSame) {
        if growType == .orderedSame {
            tickerChangesLabel.backgroundColor = .clear
            switch number.compare(NSNumber(value: 0)) {
            case .orderedSame:
                tickerChangesLabel.text = ""
            case .orderedAscending:
                tickerChangesLabel.text = "\(number)%"
                tickerChangesLabel.textColor = .red
            case .orderedDescending:
                tickerChangesLabel.text = "\(number)%"
                tickerChangesLabel.textColor = .green
            }
        } else if growType == .orderedAscending {
            tickerChangesLabel.backgroundColor = .green
            tickerChangesLabel.textColor = .white
            tickerChangesLabel.text = "\(number)%"
        } else if growType == .orderedDescending {
            tickerChangesLabel.backgroundColor = .red
            tickerChangesLabel.textColor = .white
            tickerChangesLabel.text = "\(number)%"
        }
    }
    
    func updateCell(with stock: Stock) {
        logoImageView.sd_setImage(with: stock.logoURL(), completed: nil)
        tickerIDLabel.text = stock.c
        stockNameLabel.text = stock.exchangeInfo()
        
        setupTickerChanges(with: stock.pcp, growType: stock.growType)
        tickerTradesLabel.text = stock.lastTradeInfo()
    }

}

extension StockTableViewCell {
    func addSubviews() {
        // left side
        contentView.addSubview(logoImageView)
        contentView.addSubview(tickerIDLabel)
        contentView.addSubview(stockNameLabel)
        
        // right side
        contentView.addSubview(tickerChangesLabel)
        contentView.addSubview(tickerTradesLabel)
    }
    
    func makeLayout() {
        // left side
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
        
        stockNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(300)
            $0.height.equalTo(20)
        }

        // right side
        tickerChangesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.width.equalTo(70)
            $0.height.equalTo(20)
        }
        
        tickerTradesLabel.snp.makeConstraints {
            $0.right.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(300)
            $0.height.equalTo(20)
        }
    }
}
