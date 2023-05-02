//
//  IcePickerView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct IcePickerView: View {
    
    @Binding var iceSelction: IceHot
    
    var body: some View {
        Picker("What's here", selection: self.$iceSelction) {
            ForEach(IceHot.allCases, id: \.self) { option in
                Text(option.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .offset(y: -40)
    }
}

struct IcePickerView_Previews: PreviewProvider {
    static var previews: some View {
        IcePickerView(iceSelction: .constant(.hot))
    }
}
