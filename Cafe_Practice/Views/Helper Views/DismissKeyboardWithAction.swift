//
//  DismissKeyboardWithAction.swift
//  Cafe_Practice
//
//  Created by 김창현 on 5/1/23.
//

import SwiftUI
import Foundation

struct DismissKeyboardWithAction: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(TapGesture().onEnded {
                action()
                dismissKeyboard()
            })
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

