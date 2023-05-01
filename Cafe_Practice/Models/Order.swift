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
    case schw = "Small Chocolate w/ Whip Cream"
    case lchw = "Large Chocolate w/ Whip Cream"
    case tea = "Tea"
}

enum IceHot: String, CaseIterable {
    case iced = "Iced"
    case hot = "Hot"
}

struct Order: Identifiable {
    var id = UUID()
    
    var coffee: Coffees
    var numberOfCoffee: Int
    var iceHot: IceHot
    var notes: String
}
