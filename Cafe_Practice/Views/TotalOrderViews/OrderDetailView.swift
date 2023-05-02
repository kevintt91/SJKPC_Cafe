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
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Boozer #" + boozerNumber)
                    .foregroundColor(.secondary)
                    .font(.title3)
            }
            
            List(coffeeOrderVM.orders, id: \.coffee) { order in
                TotalOrderCell(coffeeOrderVM: coffeeOrderVM, order: order)
                    .contentShape(Rectangle())
                    .onTapGesture { }
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Complete Order")
                    .frame(width: Constants.screenSize.width - 40, height: 80)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                            .frame(width: Constants.screenSize.width - 40, height: 80)
                    )
            }
            .buttonStyle(PlainButtonStyle())
        }
        .navigationTitle("Customer: " + customerName)
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
