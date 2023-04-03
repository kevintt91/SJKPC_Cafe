//
//  CoffeeOrderViewModel.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import Foundation
import SwiftUI

//class CoffeeOrderListViewModel: ObservableObject {
//
//    @Published var orders = [CoffeeOrderViewModel]()
//
//    init() {
//        self.orders = myOrders.map(CoffeeOrderViewModel.init)
//    }
//
//}

struct CoffeeOrderViewModel {
    
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
