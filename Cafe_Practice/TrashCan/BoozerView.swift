//
//  BoozerView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/28/23.
//

import SwiftUI

struct BoozerView: View {
    
    let data = (1...14).map { "\($0)" }
    let columns = [
        GridItem(.adaptive(minimum: 10))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(data, id:\.self) { item in
                ZStack {
                    Button(item, action: {
                        print("Button \(item) Clicked")
                    })
                        .frame(width: 20, height: 20)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
//                        .border(.black)
                        .padding()
                        .background(.red)
                        .cornerRadius(30)
                }
                
            }
        }
    }
}

struct BoozerView_Previews: PreviewProvider {
    static var previews: some View {
        BoozerView()
    }
}
