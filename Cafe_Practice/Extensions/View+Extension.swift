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
    
}
