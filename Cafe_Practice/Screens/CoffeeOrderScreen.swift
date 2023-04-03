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
                .navigationTitle("Order")
                
            }
            .padding()
            
        }// NavigationView
    }
}

struct CoffeeOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOrderScreen()
    }
}

// 첫 오더 뷰에는 손님이름, 부저번호만 입력하고 커피들은 따로 받아야할 듯!?
//  -> 일단은 손님이름, 부저번호가 같으면 한 오더로 처리해서 하는 방향으로 해보자
