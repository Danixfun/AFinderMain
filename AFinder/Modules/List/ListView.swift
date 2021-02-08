//
//  ListView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class ListView: UIViewController {
    
    // MARK: Properties
    var airports: AirportResponse?
    let listTableViewCellID = "ListTableViewCell"
    let rowHeight: CGFloat = 80.0
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navigationBarComponent: UINavigationItem!
    @IBOutlet var emptySearchContainer: UIView!
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var noResultsMessageLabel: UILabel!
    
    // MARK: IBAction
    @IBAction func backButtonAction(_ sender: Any) {
        self.presenter?.backButtonAction()
    }
    
    // MARK: Properties
    var presenter: ListPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad(airports: airports)
    }
}

extension ListView: ListViewProtocol {
    // TODO: implement view output methods
    
    func setUpButtons() {
        self.backButton.title = "Back".localized()
    }
    
    func setUpNavigationBarTitle() {
        navigationBarComponent.title = "Airports found".localized()
    }
    
    func setUpTableView() {
        let nib = UINib(nibName: listTableViewCellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: listTableViewCellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpEmptyTableView() {
        tableView.backgroundView = emptySearchContainer
        tableView.separatorStyle = .none
        noResultsLabel.text = "No results".localized()
        noResultsMessageLabel.text = "No results message".localized()
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

extension ListView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listTableViewCellID, for: indexPath) as! ListTableViewCell
        cell.airportData = airports?.data[indexPath.row]
        return cell
    }
    
}

