//
//  MenuCell.swift
//  FinanceStory
//
//  Created by Дарья on 08.11.2020.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let menuImageView = UIImageView()
    let menuLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        menuLabel.font = UIFont.boldSystemFont(ofSize: 12)
        menuLabel.textColor = .white
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(menuImageView)
        addSubview(menuLabel)
        
        
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: self.topAnchor),
            menuImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            menuLabel.bottomAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: -4),
            menuLabel.leadingAnchor.constraint(equalTo: menuImageView.leadingAnchor, constant: 8),
            menuLabel.trailingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 8)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
