//
//  CoffeeOrderViewModel.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.ddd
//

import SwiftUI

class CoffeeOrderViewModel: ObservableObject {

    @Published var orders = [Order]()
    
    func addOrder(_ newOrder: Order) {
        if let sameOrderIndex = orders.firstIndex(where: { order in
            order.coffee == newOrder.coffee &&
            order.iceHot == newOrder.iceHot &&
            order.notes == newOrder.notes
        }) {
            orders[sameOrderIndex].numberOfCoffee += newOrder.numberOfCoffee 
            
        } else {
            self.orders.append(newOrder)
        }
    }
    
    func totalOrder() {
        print("order: \(orders)")
        print("Number of orders: \(orders.count)")
    }
    
    func removeOrder(_ deleteOrder: Order) {
        print("func removeOrder")
        if let index = self.orders.firstIndex(where: { $0.id == deleteOrder.id }) {
            print("Removing!")
            self.orders.remove(at: index)
        }
    }
    
    func clearOrder() {
        self.orders.removeAll()
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
    
    var notes: String {
        order.notes
    }
    
    init(order: Order) {
        self.order = order
    }
}
