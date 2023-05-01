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
//    var customerOrder: Order
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Boozer #" + boozerNumber)
                    .foregroundColor(.secondary)
                    .font(.title3)
            }
            
            List(coffeeOrderVM.orders, id: \.coffee) { order in
                TotalOrderCell(order: order)
                    .contentShape(Rectangle())
                    .onTapGesture { }
            }
            
            Spacer()
            
            Button("Complete Order", action: {})
                .padding(20)
                .frame(width: Constants.screenSize.width - 40, height: 80)
                .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                .cornerRadius(16)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 22))
        }
        .navigationTitle("Customer: " + customerName)
//        .onAppear {
//            self.coffeeOrderVM.addOrder(
//                Order(coffee: .am, numberOfCoffee: 1, iceHot: .hot, whipcream: .NoWhip, notes: "")
//            )
//        }
        
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CoffeeOrderViewModel()
        return OrderDetailView(
            coffeeOrderVM: vm,
            customerName: "철수 어린이",
            boozerNumber: "999"
        )
    }
}
