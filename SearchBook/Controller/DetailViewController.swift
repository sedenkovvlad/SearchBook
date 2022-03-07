//
//  DetailViewController.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    
    var book: VolumeInfo?
    
    private let bookImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureUI()
        setup()
    }
    
    
    private func setup() {
        guard let bookUrl = book?.imageLinks?.smallThumbnail else { return }
        guard let url = URL(string: bookUrl) else { return }
        bookImage.sd_setImage(with: url, completed: nil)
        titleLabel.text = book?.title
        authorLabel.text = book?.authors?.joined(separator: ",")
        descriptionLabel.text = book?.description
    }
    
}


extension DetailViewController {
    
    private func configureScrollView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    private func configureUI() {
        view.backgroundColor = .black
        contentView.backgroundColor = .black
        contentView.addSubview(bookImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(authorLabel)
        
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            authorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bookImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bookImage.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
