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
    @State private var whipSelction: Whipcream = .NoWhip
    @State private var numCoffee: Int = 0
    @State private var notes: String = ""
    
    @ObservedObject private var coffeeOrderVM: CoffeeOrderViewModel
    
    init() {
        self.coffeeOrderVM = CoffeeOrderViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack {
                    CustomerNameView(customerName: self.$customerName)
                    BoozerNumView(boozerNum: self.$boozerNum)
                }

                IcePickerView(iceSelction: self.$iceSelction)
                
                CoffeeListView(coffeeSelection: self.$coffeeSelction)
                
                WhipPickerView(whipSelction: self.$whipSelction)
                
                TotalNumOfCoffeeView(numCoffee: self.$numCoffee)
                
                NotesView(notes: self.$notes)
                
                HStack {
                    ClearButtonView(
                        iceSelction: self.$iceSelction,
                        coffeeSelction: self.$coffeeSelction,
                        whipSelction: self.$whipSelction,
                        numCoffee: self.$numCoffee,
                        notes: self.$notes
                    )
                    
                    AddCompleteButtonsView(
                        customerName: self.customerName,
                        boozerNum: self.boozerNum,
                        order: Order(
                            coffee: coffeeSelction,
                            numberOfCoffee: numCoffee,
                            iceHot: iceSelction,
                            whipcream: whipSelction,
                            notes: notes
                        )
                    )
                }
                
                .navigationTitle("Order")
                
            }
            .padding()
            
        }
    }
}

struct CoffeeOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOrderScreen()
    }
}
