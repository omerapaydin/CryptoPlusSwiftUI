//
//  ContentView.swift
//  CryptoPlusSwiftUI
//
//  Created by Ömer on 2.04.2026.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var cyrptoListViewModel = CryptoListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                LinearGradient(
                    gradient: Gradient(colors: [.black, .blue.opacity(0.7)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        ForEach(cyrptoListViewModel.cryptoList, id: \.id) { crypto in
                            
                            CryptoCardView(crypto: crypto)
                        }
                    }
                    .padding()
                }
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        Task {
                            await cyrptoListViewModel.downloadCryptoAsync(
                                url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
                            )
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.clockwise")
                            Text("Refresh")
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                }
            }
            .navigationTitle(Text("Crypto Plus"))
        }
        .task {
            await cyrptoListViewModel.downloadCryptoAsync(
                url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
            )
        }
    }
}

struct CryptoCardView: View {
    
    let crypto: CryptoViewModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                Text(crypto.currency)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Cryptocurrency")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$\(crypto.price)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.green)
        }
        .padding()
        .background(
            ZStack {
               
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            }
        )
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    MainView()
}
