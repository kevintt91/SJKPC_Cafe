//
//  TotalOrderCell.swift
//  Cafe_Practice
//
//  Created by 김창현 on 4/4/23.
//

import SwiftUI

struct TotalOrderCell: View {
    
    @ObservedObject var coffeeOrderVM = CoffeeOrderViewModel()
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(order.coffee.rawValue)
                    .font(.title2)
                .fontWeight(.medium)
                
                Spacer()
                
                Text(order.iceHot.rawValue)
            }
            
            VStack(alignment: .leading) {                
                Text(order.notes)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding([.bottom], 10)
            
            HStack {
                Button("\(order.numberOfCoffee)", action: {
                    print("number Of Coffee")
                })
                .buttonStyle(BorderlessButtonStyle())
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
                .background(.teal)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
                Spacer()
                
                Button("Remove", action: {
                    print("Deleting this Order: \(order)")
                    coffeeOrderVM.removeOrder(self.order)
                })
                .buttonStyle(BorderlessButtonStyle())
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .padding(40)
        .cornerRadius(10)
    }
}

struct TotalOrderCell_Previews: PreviewProvider {
    static var previews: some View {
        TotalOrderCell(order:
            Order(coffee: .cm, numberOfCoffee: 1, iceHot: .hot, notes: "No Milk!")
        )
    }
}
