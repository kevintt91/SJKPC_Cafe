//
//  CountingView.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/31/23.
//

import SwiftUI

struct CountingView: View {
    
    @State private var externalCount = 0
    
    var body: some View {
        VStack {
            Spacer()
            CounterView(count: $externalCount)//(count: externalCount)
            Spacer()
            Text("External Count: \(externalCount)")
            
            Button("External +1") {
                externalCount += 1
            }
            
            Button("Clear from CountingView") {
                externalCount = 0
            }
            Spacer()
        }
        .font(.title)
    }
}

struct CounterView: View {
    
    @Binding var count: Int
    @State private var localCount = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(localCount)")
            Button("+1") {
//                count += 1
                localCount += 1
            }
            Button("Clear from CounterView") {
//                count = 0
                localCount = 0
            }
        }
        .onAppear {
            let _ = print("onAppear")
            localCount = count
        }
        .onDisappear {
            let _ = print("onDisappear")
            count = localCount
        }
        .onChange(of: count) { newValue in
            let _ = print("onChange")
            localCount = count + newValue
        }
    }
    
}

struct CountingView_Previews: PreviewProvider {
    static var previews: some View {
        CountingView()
    }
}
