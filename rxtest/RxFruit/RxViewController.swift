//
//  RxViewController.swift
//  rxtest
//
//  Created by Przemyslaw Biskup on 29/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit
import RxSwift

final class RxViewController: UIViewController {
    
    @IBOutlet private weak var availabilitySwitch: UISwitch!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchPriceField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    let bag = DisposeBag()
    
    var fruits = Variable<[Fruit]>([])
    var filtredFruits = Variable<[Fruit]>([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruits.value = globFru
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        Observable
            .combineLatest(fruits.asObservable(),
                           searchTextField.rx.text,
                           searchPriceField.rx.text,
                           availabilitySwitch.rx.isOn,
                           resultSelector: { (fruits, text, price, isAvailabe) in
                            return fruits
                                .filter { isAvailabe ? $0.isAvailable : true }
                                .filter { (text == nil || text == "") ? true : $0.name.contains(text!) }
//                                .filter { (price == nil || price == "") ? true : $0.price == Int(price) }
// Expression was too complex to be solved in reasonable time ?? WTF ?
            })
            .bind(to: filtredFruits)
            .disposed(by: bag)
        
        filtredFruits
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, element, cell in
                cell.textLabel?.text = element.name + "\(row)"
        }.disposed(by: bag)
    }
}
