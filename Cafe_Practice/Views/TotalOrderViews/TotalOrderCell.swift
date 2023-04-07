//
//  TotalOrderCell.swift
//  Cafe_Practice
//
//  Created by 김창현 on 4/4/23.
//

import SwiftUI

struct TotalOrderCell: View {
    
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
                Text(order.whipcream.rawValue)
                    .foregroundColor(.secondary)
                    .italic()
                
                Text(order.notes)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding([.bottom], 10)
            
            HStack {
                Button("\(order.numberOfCoffee)", action: {
                    print("Remove Button Clicked")
                })
                .foregroundColor(.black)
                .padding(10)
                .frame(width: 50, height: 40)
                .background(.teal)
                .cornerRadius(20)
                
                Spacer()
                
                Button("Remove", action: {
                    print("Remove Button Clicked")
                })
                .foregroundColor(.black)
                .padding(10)
                .frame(width: 100, height: 40)
                .background(.teal)
                .cornerRadius(20)
            }
        }
        .padding(40)
        .cornerRadius(10)
    }
}

struct TotalOrderCell_Previews: PreviewProvider {
    static var previews: some View {
        TotalOrderCell(order:
            Order(coffee: .cm, numberOfCoffee: 1, iceHot: .hot, whipcream: .NoWhip, notes: "No Milk!")
        )
    }
}
