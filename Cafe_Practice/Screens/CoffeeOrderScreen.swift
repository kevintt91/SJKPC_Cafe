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
    
    @StateObject var coffeeOrderVM: CoffeeOrderViewModel
    
    var body: some View {
        NavigationView {
            
            ScrollView {
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
                        
                        HStack {
                            NavigationLink(
                                destination: OrderDetailView(
                                    coffeeOrderVM: coffeeOrderVM,
                                    customerName: self.customerName,
                                    boozerNumber: self.boozerNum,
                                    customerOrder: Order(
                                        coffee: coffeeSelction,
                                        numberOfCoffee: numCoffee,
                                        iceHot: iceSelction,
                                        whipcream: whipSelction,
                                        notes: notes
                                    )
                                )
                            ){
                                Text("Add")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .padding(20)
                            .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                            .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                            
                        }
                    }
                    
                    .navigationTitle("Order")
                    
                }
                .padding()
            }
            
        }
    }
}

struct CoffeeOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOrderScreen(
            coffeeOrderVM: CoffeeOrderViewModel())
    }
}
