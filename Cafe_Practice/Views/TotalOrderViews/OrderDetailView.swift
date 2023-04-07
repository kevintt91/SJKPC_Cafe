//
//  OrderDetailView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct OrderDetailView: View {

    @ObservedObject var coffeeOrderVM = CoffeeOrderViewModel()
    var customerName: String
    var boozerNumber: String
    var customerOrder: Order
    
    var body: some View {
        
        ZStack {
            List(coffeeOrderVM.orders, id: \.coffee) { order in
                TotalOrderCell(order: order)
            }
        }
        .onAppear {
            self.coffeeOrderVM.addOrder(customerOrder)
        }
        
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CoffeeOrderViewModel()
        let order = Order(
            coffee: .am,
            numberOfCoffee: 1,
            iceHot: .iced,
            whipcream: .NoWhip,
            notes: "Nothing"
        )
        return OrderDetailView(
            coffeeOrderVM: vm,
            customerName: "철수 어린이",
            boozerNumber: "999",
            customerOrder: order
        )
    }
}
