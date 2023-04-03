//
//  BoozerNumView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct BoozerNumView: View {
    
    @Binding var boozerNum: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Boozer Number:")
                .opacity(0.5)
                .foregroundColor(.black)
                .padding([.leading], 10)
            
            TextField("부저번호", text: self.$boozerNum)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
        }
        .frame(width: Constants.screenSize.width/1.1, height: Constants.screenSize.height/19)
        .offset(x: -8, y: -20)
    }
}

struct BoozerNumView_Previews: PreviewProvider {
    static var previews: some View {
        BoozerNumView(boozerNum: .constant("1"))
    }
}
