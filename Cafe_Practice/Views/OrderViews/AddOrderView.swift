//
//  AddOrderView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 5/1/23.
//

import SwiftUI

enum AlertType: Identifiable {
    case missingCustomerName
    case missingBoozerNumber
    case missingNumOfCoffee
    
    var id: Int {
        switch self {
        case .missingCustomerName:
            return 0
        case .missingBoozerNumber:
            return 1
        case .missingNumOfCoffee:
            return 2
        }
    }
}

struct AddOrderView: View {    
    var customerName: String
    var numCoffee: Int
    var boozerNum: String
    var theOrder: Order
    
    @Binding var showNotification: Bool
    @State private var alertType: AlertType?
    
    @StateObject var coffeeOrderVM: CoffeeOrderViewModel
    
    var body: some View {
        Button(action: {
            guard !customerName.isEmpty else {
                self.alertType = .missingCustomerName
                return
            }
            
            guard numCoffee != 0 else {
                self.alertType = .missingNumOfCoffee
                return
            }
            
            if boozerNum.isEmpty {
                self.alertType = .missingBoozerNumber
            } else {
                let order = theOrder
                withAnimation(.spring()) {
                    showNotification = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.spring()) {
                        showNotification = false
                    }
                }
                coffeeOrderVM.addOrder(order)
            }
        }) {
            Text("Add")
                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                        .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                )
        }
        .buttonStyle(PlainButtonStyle())
        .alert(item: self.$alertType, content: { alert in
            switch alert {
            case .missingCustomerName:
                return Alert(
                        title: Text("Missing Customer Name"),
                        message: Text("Enter Customer's name"),
                        dismissButton: .default(Text("OK"))
                )
                
            case .missingNumOfCoffee:
                return Alert(
                        title: Text("Missing Number of Coffee"),
                        message: Text("Enter the number of coffee"),
                        dismissButton: .default(Text("OK"))
                )
                
            case .missingBoozerNumber:
                return Alert(
                        title: Text("Missing Boozer Number"),
                        message: Text("Boozer number is Optional."),
                        primaryButton: .cancel(Text("Cancel")),
                        secondaryButton: .default(Text("Add Order")) {
                            let order = theOrder
                            withAnimation(.spring()) {
                                showNotification = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.spring()) {
                                    showNotification = false
                                }
                            }
                            coffeeOrderVM.addOrder(order)
                        }
                    )
            }
        })
    }
}
