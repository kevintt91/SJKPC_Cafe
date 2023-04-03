//
//  TotalNumOfCoffeeView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct TotalNumOfCoffeeView: View {
    
    @Binding var numCoffee: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Stepper(value: self.$numCoffee, in: 0...20, step: 1) {
                HStack {
                    Text("몇잔? (최대 20잔)")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(self.numCoffee)"+"잔")
                }
            }
        }
        .offset(y: -50)
        .frame(width: Constants.screenSize.width / 1.4)
    }
}

struct TotalNumOfCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        TotalNumOfCoffeeView(numCoffee: .constant(111))
    }
}
