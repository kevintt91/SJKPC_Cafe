//
//  NextView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 5/1/23.
//

import SwiftUI

struct NextView: View {
    
    var customerName: String
    var boozerNum: String
    @StateObject var coffeeOrderVM: CoffeeOrderViewModel
    
    var body: some View {
        NavigationLink {
            // Destination
            OrderDetailView(
                coffeeOrderVM: coffeeOrderVM,
                customerName: self.customerName,
                boozerNumber: self.boozerNum)
        } label: {
            Text("Next")
                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 1, green: 0, blue: 0.3488045335, alpha: 1)))
                        .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                )
        }
    }
}
