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
    private var searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupSearchBar()
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
//MARK: UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
}

//MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.fetcher.fetchBook(search: text) { [weak self] books in
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
    
    private func setupSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.placeholder = "Search books"
        searchBar.barTintColor = .black
        searchBar.tintColor = #colorLiteral(red: 0.2352941176, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor.white
        self.tableView.tableHeaderView = searchBar
    }
}
