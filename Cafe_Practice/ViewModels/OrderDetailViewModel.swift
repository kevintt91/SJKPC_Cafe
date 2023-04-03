//
//  OrderDetailViewModel.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/31/23.
//

import Foundation
import SwiftUI

class OrderDetailViewModel: ObservableObject {
    
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var coffeeOrders: [CoffeeOrderViewModel] {
        let coffeeOrder = CoffeeOrderViewModel(order: order)
        return [coffeeOrder]
    }
}
