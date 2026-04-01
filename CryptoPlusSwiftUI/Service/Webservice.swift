//
//  Webservice.swift
//  CryptoPlusSwiftUI
//
//  Created by Ömer on 2.04.2026.
//

import Foundation


class Webservice {
    
    func downloadCurrenciesAsync( url : URL ) async throws -> [CyrptoCurrency] {
        
        let ( data, _ ) = try await URLSession.shared.data(from: url)
        let currencies = try JSONDecoder().decode([CyrptoCurrency].self, from: data)
        return currencies ?? []
        
    }
    
}
