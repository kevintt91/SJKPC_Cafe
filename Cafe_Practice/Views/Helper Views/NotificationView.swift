//
//  NotificationView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 5/1/23.
//

import SwiftUI

struct NotificationView: View {
    
    let message: String
    let backgroundColor: Color
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(message: "Testing Msg", backgroundColor: .black)
    }
}
