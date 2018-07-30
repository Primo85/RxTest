//
//  FruitPresenter.swift
//  rxtest
//
//  Created by Przemyslaw Biskup on 29/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

protocol FruitProtocol: class {
    func updateUI()
}

final class FruitPresenter {
    
    private weak var view: FruitProtocol?
    
    init(view: FruitProtocol) {
        self.view = view
    }
    
    func fetchFruits() {
        fruits = globFru
    }
    
    private(set) var filtredFruits: [Fruit] = [] {
        didSet {
            view?.updateUI()
        }
    }
    
    var isAvailabe: Bool = true { didSet { filterFruits() } }
    var textInName: String? = nil { didSet { filterFruits() } }
    var price: Int? = nil { didSet { filterFruits() } }
    
    // MARK: - private
    private var fruits: [Fruit] = [] {
        didSet {
            filterFruits()
        }
    }
    
    private func filterFruits() {
        filtredFruits = fruits
            .filter { isAvailabe ? $0.isAvailable : true }
            .filter { textInName == nil ? true : $0.name.contains(textInName!) }
            .filter { price == nil ? true : $0.price == price }
        
    }
}
