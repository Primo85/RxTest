//
//  Fruit.swift
//  rxtest
//
//  Created by Przemyslaw Biskup on 29/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit


struct Fruit {
    let name: String
    let color: UIColor
    var isAvailable: Bool
    var price: Int
}


let globFru = [Fruit(name: "apple", color: .red, isAvailable: true, price: 23),
               Fruit(name: "orange", color: .orange, isAvailable: true, price: 18),
               Fruit(name: "sliwka", color: .purple, isAvailable: false, price: 22),
               Fruit(name: "cherry", color: .red, isAvailable: true, price: 16),
               Fruit(name: "citrin", color: .yellow, isAvailable: true, price: 33),
               Fruit(name: "apple", color: .green, isAvailable: false, price: 26),
               Fruit(name: "apple", color: .yellow, isAvailable: false, price: 37),
               Fruit(name: "banana", color: .yellow, isAvailable: false, price: 19),
               Fruit(name: "limon", color: .green, isAvailable: true, price: 23)]
