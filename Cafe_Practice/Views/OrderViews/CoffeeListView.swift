//
//  CoffeeListView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/28/23.
//

import SwiftUI

struct CoffeeListView: View {
    
    @Binding var coffeeSelection: Coffees
    let columns = [GridItem(spacing: 20), GridItem(spacing: 20), GridItem(spacing: 20)]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(Coffees.allCases, id: \.self) { coffee in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(coffeeSelection == coffee ? Color.blue : Color.black)
                        .frame(width: 100, height: 70)
                        .overlay(
                            Button(coffee.rawValue, action: {
                                coffeeSelection = coffee
                            })
                            .foregroundColor(.white)
                        )
                } // ZStack
            } // ForEach
        } // LazyVGrid
        .offset(y: -50)
    }
    
}


struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView(coffeeSelection: .constant(.am))
    }
}
