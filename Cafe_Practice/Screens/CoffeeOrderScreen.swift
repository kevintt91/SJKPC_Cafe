//
//  CoffeeOrderScreen.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct CoffeeOrderScreen: View {
    
    @State private var customerName: String = ""
    @State private var boozerNum: String = ""
    @State private var iceSelction: IceHot = .hot
    @State private var coffeeSelction: Coffees = .am
    @State private var numCoffee: Int = 0
    @State private var notes: String = ""
    
    @State private var showNotification = false
    
    @StateObject var coffeeOrderVM: CoffeeOrderViewModel
    
    // Testing
    @State private var showSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                    .edgesIgnoringSafeArea(.all)
                    .dismissKeyboardOnTap()
                
                ScrollView {
                    VStack {
                        VStack {
                            CustomerNameView(customerName: self.$customerName)
                            BoozerNumView(boozerNum: self.$boozerNum)
                        }
                        IcePickerView(iceSelction: self.$iceSelction)
                        CoffeeListView(coffeeSelection: self.$coffeeSelction)
                        TotalNumOfCoffeeView(numCoffee: self.$numCoffee)
                        NotesView(notes: self.$notes)
                        
                        HStack {
                            NextView(
                                customerName: self.customerName,
                                boozerNum: self.boozerNum,
                                coffeeOrderVM: coffeeOrderVM
                            )
                            
                            AddOrderView(
                                customerName: self.customerName,
                                numCoffee: self.numCoffee,
                                boozerNum: self.boozerNum,
                                theOrder: Order(
                                    coffee: coffeeSelction,
                                    numberOfCoffee: numCoffee,
                                    iceHot: iceSelction,
                                    notes: notes
                                ),
                                showNotification: self.$showNotification,
                                coffeeOrderVM: coffeeOrderVM
                            )
                        } // HStack with two buttons
                        
                    }
                    .padding()
                }
                .navigationTitle("Order")
                .toolbar {
                    Button {
                        self.customerName = ""
                        self.boozerNum = ""
                        self.coffeeSelction = .am
                        self.numCoffee = 0
                        self.iceSelction = .hot
                        self.notes = ""
                        
                    } label: {
                        Image(systemName: "eraser")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                }
            } // ScrollView
        } // NavigationView
        .overlay(
            Group{
                if showNotification {
                    NotificationView(message: "Order Added!", backgroundColor: .blue)
                        .padding(.top, 10)
                        .transition(.move(edge: .top))
                }
            }, alignment: .top
        )
    }
}

struct CoffeeOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOrderScreen(
            coffeeOrderVM: CoffeeOrderViewModel())
    }
}
