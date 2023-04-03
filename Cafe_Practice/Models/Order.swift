//
//  Order.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/28/23.
//

import Foundation

enum Coffees: String, CaseIterable {
    case am = "Americano"
    case lt = "Latte"
    case vl = "Vanilla\nLatte"
    case cm = "Caramel\nMachiato"
    case cp = "Cappucino"
    case expresso = "Espresso"
    case sch = "Small\nChocolate"
    case lch = "Large\nChocolate"
    case tea = "Tea"
}

enum IceHot: String, CaseIterable {
    case iced = "Iced"
    case hot = "Hot"
}

enum Whipcream: String, CaseIterable {
    case YesWhip = "Yes Whip cream"
    case NoWhip = "No Whip cream"
}

struct Order {
    let coffee: Coffees
    let numberOfCoffee: Int
    let iceHot: IceHot
    let whipcream: Whipcream
    let notes: String
}
