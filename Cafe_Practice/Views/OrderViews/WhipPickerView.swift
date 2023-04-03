//
//  WhipPickerView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct WhipPickerView: View {
    
    @Binding var whipSelction: Whipcream
    
    var body: some View {
        Picker("", selection: $whipSelction) {
            ForEach(Whipcream.allCases, id: \.self) { option in
                Text(option.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .offset(y: -50)
    }
}

struct WhipPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WhipPickerView(whipSelction: .constant(.NoWhip))
    }
}
