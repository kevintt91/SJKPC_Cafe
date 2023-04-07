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
    case vl = "Vanilla Latte"
    case cm = "Caramel Machiato"
    case cp = "Cappucino"
    case expresso = "Espresso"
    case sch = "Small Chocolate"
    case lch = "Large Chocolate"
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

struct Order: Identifiable {
    var id = UUID()
    
    var coffee: Coffees
    var numberOfCoffee: Int
    var iceHot: IceHot
    var whipcream: Whipcream
    var notes: String
}
