//
//  CyrptoCurrency.swift
//  CryptoPlusSwiftUI
//
//  Created by Ömer on 2.04.2026.
//

import Foundation


struct CyrptoCurrency : Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    
    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
