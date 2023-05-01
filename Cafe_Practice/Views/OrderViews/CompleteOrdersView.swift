//
//  CompleteOrdersView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 4/10/23.
//

import SwiftUI

struct CompleteOrdersView: View {
    
    var body: some View {
//        NavigationLink(<#LocalizedStringKey#>
//            destination: OrderDetailView()
//        ){
            Text("Complete")
                .font(.system(size: 22))
                .foregroundColor(.white)
                .fontWeight(.bold)
//        }
        .padding(20)
        .frame(width: (Constants.screenSize.width - 40)/2, height: 80)
        .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
        .cornerRadius(16)
    }
}

struct CompleteOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteOrdersView()
    }
}
