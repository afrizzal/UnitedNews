//
//  ViewController.swift
//  UnitedNews
//
//  Created by Afrizzal on 13/07/21.
//

import UIKit
// TableView
// Custom Cell
// API Caller
// Open the News Story
// Search for News Story

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: NewsTableViewCellViewModel.identifier)
        return table
    }()
    
    private var viewModels = [NewsTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="News"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getTopStories {result in
        switch result {
        case .success(let articles):
            self?.viewModels = articles.compactMap ({
                NewsTableViewCellViewModel(title: $0.title,
                                           subtitle: $0.description ?? "No Description"
                                           imageURL: URL(string: $0.urlToImage ?? "")
                )
            })
        case .failure(let error):
            print(error)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCellViewModel.identifier,
            for: IndexPath
        )as? NewsTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
    }
}

