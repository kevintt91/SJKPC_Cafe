//
//  AddCompleteButtonsView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct AddCompleteButtonsView: View {
    
    var customerName: String
    var boozerNum: String
    var order: Order
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: OrderDetailView(
                    customerName: self.customerName,
                    boozerNumber: self.boozerNum,
                    customerOrder: order
                )
            ){
                Text("Add")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }.padding(20)
                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                .cornerRadius(16)
            
        }
    }
}

//struct AddCompleteButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCompleteButtonsView(iceSelction: .constant(.hot), coffeeSelction: .constant(.am), whipSelction: .constant(.NoWhip), numCoffee: 1, notes: "없음")
//    }
//}
