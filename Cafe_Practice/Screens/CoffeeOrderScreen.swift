//
//  CoffeeOrderScreen.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

enum AlertType: Identifiable {
    case missingCustomerName
    case missingBoozerNumber
    case orderPlaced
    
    var id: Int {
        switch self {
        case .missingCustomerName:
            return 0
        case .missingBoozerNumber:
            return 1
        case .orderPlaced:
            return 2
        }
    }
}

struct CoffeeOrderScreen: View {
    
    @State private var customerName: String = ""
    @State private var boozerNum: String = ""
    @State private var iceSelction: IceHot = .hot
    @State private var coffeeSelction: Coffees = .am
    @State private var numCoffee: Int = 0
    @State private var notes: String = ""
    
    @State private var showAlert = false
    @State private var orderPlaced = false
    @State private var alertType: AlertType?
    
    @StateObject var coffeeOrderVM: CoffeeOrderViewModel
    
    // Testing
    @State private var showSheet = false
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    VStack {
                        CustomerNameView(customerName: self.$customerName)
                        BoozerNumView(boozerNum: self.$boozerNum)
                    }.dismissKeyboardOnTap()

                    IcePickerView(iceSelction: self.$iceSelction)
                    
                    CoffeeListView(coffeeSelection: self.$coffeeSelction)
                    
                    TotalNumOfCoffeeView(numCoffee: self.$numCoffee)
                    
                    NotesView(notes: self.$notes).dismissKeyboardOnTap()
                    
                    HStack {
                        NavigationLink(
                            destination: OrderDetailView(
                                coffeeOrderVM: coffeeOrderVM,
                                customerName: self.customerName,
                                boozerNumber: self.boozerNum
                            )
                        ){
                            Text("Next")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding(20)
                        .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                        .background(Color(#colorLiteral(red: 1, green: 0, blue: 0.3488045335, alpha: 1)))
                        .cornerRadius(16)
                        
                        Button("Add") {
                            guard !customerName.isEmpty else {
                                self.alertType = .missingCustomerName
                                return
                            }
                            
                            if boozerNum == "" {
                                self.alertType = .missingBoozerNumber
                            } else {
                                self.alertType = .orderPlaced
                            }
                        }
                        .alert(item: self.$alertType, content: { alert in
                            switch alert {
                            case .missingCustomerName:
                                return Alert(
                                        title: Text("Missing Customer Name"),
                                        message: Text("Enter Customer's name"),
                                        dismissButton: .default(Text("OK"))
                                )
                            case .missingBoozerNumber:
                                return Alert(
                                        title: Text("Missing Boozer Number"),
                                        message: Text("Boozer number is Optional."),
                                        primaryButton: .cancel(Text("Cancel")),
                                        secondaryButton: .default(Text("Add Order")) {
                                            let order = Order(
                                                coffee: coffeeSelction,
                                                numberOfCoffee: numCoffee,
                                                iceHot: iceSelction,
                                                whipcream: whipSelction,
                                                notes: notes
                                            )
                                            coffeeOrderVM.addOrder(order)
                                            self.alertType = .orderPlaced
                                        }
                                    )
                            case .orderPlaced:
                                return Alert(
                                        title: Text("Order Placed"),
                                        message: Text("Your order has been successfully placed!"),
                                        dismissButton: .default(Text("OK")) {
                                            let order = Order(
                                                coffee: coffeeSelction,
                                                numberOfCoffee: numCoffee,
                                                iceHot: iceSelction,
                                                whipcream: whipSelction,
                                                notes: notes
                                            )
                                            coffeeOrderVM.addOrder(order)
                                            self.alertType = nil // Reset alertType to nil after dismissing the alert
                                        }
                                    )
                            }
                        })
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(20)
                        .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                        .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                        .cornerRadius(16)
                        
                    } // HStack with two buttons
                    .navigationTitle("Order")
                    .toolbar {
                        Button {
                            self.customerName = ""
                            self.boozerNum = ""
                            self.coffeeSelction = .am
                            self.numCoffee = 0
                            self.iceSelction = .hot
                            self.notes = ""
                            
                            coffeeOrderVM.clearOrder()
                            
                        } label: {
                            Image(systemName: "eraser")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        }
                        
                    }
                    
                }
                .padding()
            } // ScrollView
        } // NavigationView
    }
}

struct CoffeeOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOrderScreen(
            coffeeOrderVM: CoffeeOrderViewModel())
    }
}
