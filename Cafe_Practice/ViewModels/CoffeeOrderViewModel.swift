//
//  CoffeeOrderViewModel.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

class CoffeeOrderViewModel: ObservableObject {

    @Published var orders = [OrderViewModel]()
//    var incomingOrder = Order()
    
    func addOrder(_ newOrder: Order) {
        print("newOrder: \(newOrder)")
        let order = OrderViewModel(order: newOrder)
        print("order: \(order)")
        self.orders.append(order)
    }

}

struct OrderViewModel {
    
    let order: Order
    
    var coffeeName: String {
        order.coffee.rawValue
    }

    var numberOfCoffee: Int {
        order.numberOfCoffee
    }
    
    var iceHot: IceHot {
        order.iceHot
    }

    var whipcream: String {
        order.whipcream.rawValue
    }
    
    var notes: String {
        order.notes
    }
    
    init(order: Order) {
        self.order = order
    }
}
