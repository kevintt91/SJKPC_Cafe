//
//  View+Extension.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/28/23.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
    func dismissKeyboardOnTap() -> some View {
        self.modifier(DismissKeyboardOnTap())
    }
    
}

struct DismissKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                dismissKeyboard()
            }
    }

    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

