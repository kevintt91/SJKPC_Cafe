//
//  AddCompleteButtonsView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct AddCompleteButtonsView: View {
    
//    @Binding var iceSelction: IceHot
//    @Binding var coffeeSelction: Coffees
//    @Binding var whipSelction: Whipcream
//    @Binding var numCoffee: Int
//    @Binding var notes: String
    
    var customerName: String
    var boozerNum: String
    var order: [Order]
    
    var body: some View {
        HStack {
//            NavigationLink(destination: OrderDetailView()) {
//                Text("Add")
//                    .font(.system(size: 22))
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//            }
//            Button("Add", action: {})
//                .font(.system(size: 22))
//                .foregroundColor(.white)
//                .fontWeight(.bold)
//                .padding(20)
//                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
//                .background(.gray)
//                .cornerRadius(16)
            
//            NavigationLink(destination: OrderDetailView(orderDetailVM:
//                    CoffeeOrderViewModel(
//                        order: Order(coffee: coffeeSelction, numberOfCoffee: numCoffee, iceHot: iceSelction, whipcream: whipSelction, notes: notes)
//                    )
//               )
//            ){
//                Text("Add")
//                    .font(.system(size: 22))
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//            }.padding(20)
//                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
//                .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
//                .cornerRadius(16)
            
            
            // [Order]로 만듬... append해서 해야하는데 viewModel에서 해야할거 같음...
            Button("Clear", action: {
                
            })
                .font(.system(size: 22))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(20)
                .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
                .background(.gray)
                .cornerRadius(16)
            
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
