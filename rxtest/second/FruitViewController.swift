//
//  FruitViewController.swift
//  rxtest
//
//  Created by Przemyslaw Biskup on 29/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class FruitViewController: UIViewController {
    
    @IBOutlet private weak var availabilitySwitch: UISwitch!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchPriceField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    lazy var presenter: FruitPresenter = {
        return FruitPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchFruits()
    }
    
    @IBAction private func textFieldAction() {
        presenter.textInName = searchTextField.text == "" ? nil : searchTextField.text
    }
    @IBAction private func switchAction() {
        presenter.isAvailabe = availabilitySwitch.isOn
    }
    @IBAction private func priceAction() {
        guard let text = searchPriceField.text else { presenter.price = nil; return }
        presenter.price = text == "" ? nil : Int(text)
    }
}

extension FruitViewController: FruitProtocol {
    func updateUI() {
        tableView.reloadData()
    }
}

extension FruitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.filtredFruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = presenter.filtredFruits[indexPath.row].name
        cell.detailTextLabel?.text = "\( presenter.filtredFruits[indexPath.row].price)" + "  PLN"
        cell.backgroundColor = presenter.filtredFruits[indexPath.row].color
        return cell
    }
}
