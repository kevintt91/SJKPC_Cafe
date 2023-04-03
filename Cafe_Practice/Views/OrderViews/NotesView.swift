//
//  NotesView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import SwiftUI

struct NotesView: View {
    
    @Binding var notes: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Notes: ")
                .opacity(0.5)
                .foregroundColor(.black)
                .padding([.leading], 10)
            
            TextField("추가사항", text: self.$notes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .offset(y: -50)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: .constant("Just for previewwww"))
    }
}
