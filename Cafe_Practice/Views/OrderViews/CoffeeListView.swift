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
                    Button(action: {
                        coffeeSelection = coffee
                    }) {
                        Text(coffee.rawValue)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 75)
                            .multilineTextAlignment(.center)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(coffeeSelection == coffee ? Color.blue : Color.black)
                                    .frame(width: 120, height: 75)
                                )
                    }
                    .buttonStyle(PlainButtonStyle())

                } // ZStack
                .modifier(DismissKeyboardWithAction(action: {
                    coffeeSelection = coffee
                }))
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
