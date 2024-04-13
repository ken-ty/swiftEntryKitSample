//
//  ContentView.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import SwiftUI

struct ContentView: View {
    
    private var items = [
        ButtonItem(title: "1", action: {
            print("hod")
        }),
        ButtonItem(title: "2", action: {
            print("hod")
        }),
    ]
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self.title) { item in
                Button(item.title){
                    item.action()
                }
                    .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ContentView()
}
