//
//  ContentView.swift
//  CryptoPlusSwiftUI
//
//  Created by Ömer on 2.04.2026.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cyrptoListViewModel : CryptoListViewModel
    init() {
        self.cyrptoListViewModel = CryptoListViewModel()
        
    }
    
    
    var body: some View {
        VStack {
            
            Text("Hello, world!")
        }
        
    }
}

#Preview {
    MainView()
}
