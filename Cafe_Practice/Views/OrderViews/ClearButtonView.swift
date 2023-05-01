//
//  ClearButtonView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 4/3/23.
//

import SwiftUI

struct ClearButtonView: View {
    
    @Binding var iceSelction: IceHot
    @Binding var coffeeSelction: Coffees
    @Binding var whipSelction: Whipcream
    @Binding var numCoffee: Int
    @Binding var notes: String
    
    var body: some View {
        Button("Clear", action: {
            self.iceSelction = .iced
            self.coffeeSelction = .am
            self.whipSelction = .NoWhip
            self.numCoffee = 0
            self.notes = ""
        })
            .font(.system(size: 22))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(20)
            .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
            .background(.gray)
            .cornerRadius(16)
    }
}
