//
//  SearchCell.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import Foundation
import UIKit

final class SearchCell: UITableViewCell {
    static let reuseId = "SearchCell"
    
    private let bookImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UI
extension SearchCell {
    func configureUI() {
        contentView.addSubview(bookImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.layer.cornerRadius = 8
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority(751), for: .vertical)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bookImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bookImage.heightAnchor.constraint(equalToConstant: 60),
            bookImage.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 8),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
