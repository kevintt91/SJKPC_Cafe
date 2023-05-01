//
//  CustomerNameView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct CustomerNameView: View {
    
    @Binding var customerName: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Customer Name:")
                .opacity(0.5)
                .foregroundColor(.black)
                .padding([.leading], 10)
            
            TextField("손님 이름", text: self.$customerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .frame(width: Constants.screenSize.width/1.1, height: Constants.screenSize.height/19)
        .offset(x: -8, y: -10)
    }
    
}

struct CustomerNameView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerNameView(customerName: .constant("Kevin Kim!@#$"))
    }
}
