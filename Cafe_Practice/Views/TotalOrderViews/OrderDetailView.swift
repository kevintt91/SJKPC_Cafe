//
//  OrderDetailView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct OrderDetailView: View {
    
//    @ObservedObject var orderDetailVM: CoffeeOrderViewModel
    
    var customerName: String
    var boozerNumber: String
    var customerOrder: Order
    @ObservedObject var testingOrderVM = CoffeeOrderViewModel()
    
    var body: some View {
        VStack {
            Text("Total Order Views")
            VStack {
                Text("Customer: " + "\(customerName)")
                Text("Boozer Number?: " + "\(boozerNumber)")
//                Text("Coffee: " + customerOrder.coffee.rawValue)
//                Text("How many?: " + "\(customerOrder.numberOfCoffee)")
//                Text("iceHot: " + customerOrder.iceHot.rawValue)
//                Text("whipcream: " + customerOrder.whipcream.rawValue)
//                Text("notes: " + customerOrder.notes)
                
                ForEach(self.testingOrderVM.orders, id: \.coffeeName) { order in
                    VStack {
                        Text("Coffee: " + order.coffeeName)
                        Text("How many?: " + "\(order.numberOfCoffee)")
                        Text("iceHot: " + order.iceHot.rawValue)
                        Text("whipcream: " + order.whipcream)
                        Text("notes: " + order.notes)
                    }
                }
                
            }
            Spacer()
//            ForEach(orderDetailVM.coffeeOrders, id:\.coffeeName) { order in
//                VStack {
//                    Text(order.coffeeName)
//                    Text("Number of Coffees: \(order.numberOfCoffee)")
//                    Text(order.iceHot.rawValue)
//                    Text(order.whipcream)
//                    Text(order.notes)
//                }
//            }
        }
        .onAppear {
            self.testingOrderVM.addOrder(customerOrder)
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let order = Order(
            coffee: .am,
            numberOfCoffee: 1,
            iceHot: .iced,
            whipcream: .NoWhip,
            notes: "Nothing"
        )
        return OrderDetailView(
            customerName: "철수 어린이",
            boozerNumber: "999",
            customerOrder: order
        )
//        let viewModel = OrderDetailViewModel(order: order)
//
//        return OrderDetailView(orderDetailVM: viewModel)
    }
}
