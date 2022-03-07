//
//  SearchViewController.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    private let tableView = UITableView()
    private var books = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchBook()
    }
}


//MARK: UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId, for: indexPath) as! SearchCell
        let book = books[indexPath.row].volumeInfo
        cell.backgroundColor = .clear
        cell.configureCell(from: book)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController {
    private func fetchBook() {
        fetcher.fetchBook(search: "programming") { [weak self] books in
            guard let self = self else { return }
            guard let books = books?.items else { return }
            self.books = books
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}

//MARK: - UI
extension SearchViewController {
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseId)
    }
}
