//
//  ItemListingViewController.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation
import UIKit

protocol ItemListingViewDelegate {
    func viewDidLoad()
    var listData: [ItemListCellData] { get }
    func productCellTapped(productId: Int)
}

protocol ItemListingViewProtocol: AnyObject {
    func updateListData()
}

class ItemListingViewController: UIViewController {
    let presenter: ItemListingViewDelegate
    private let tableView: UITableView = UITableView(frame: .zero)
    init(presenter: ItemListingViewDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    
    private func intialSetup() {
        presenter.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.title = "List"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .red
        UIBarButtonItem().setBackButtonBackgroundImage(UIImage(named: "arrow.backward"), for: .normal, barMetrics: .default)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        /// View setup and constraints
        let tableViewConstraints = view.addSubview(tableView, considerSafeArea: true, with: [
            .top(),
            .bottom(),
            .leading(),
            .trailing()
        ])
        tableViewConstraints.activate()
        /// TableView Setup
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Delegate and Datasource
extension ItemListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: presenter.listData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.productCellTapped(productId: presenter.listData[indexPath.row].id)
    }
}

extension ItemListingViewController: ItemListingViewProtocol {
    func updateListData() {
        tableView.reloadData()
    }
}
