//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Nishant Taneja on 31/08/20.
//  Copyright © 2020 Nishant Taneja. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetchRate(_ rate: Double, for currency: String)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    // Initialise
    var delegate: CoinManagerDelegate?
    private let apiKey: String = PrivateData.apiKey
    private let baseUrl: String = "https://rest.coinapi.io/v1/exchangerate/BTC"
    private let currencies = [ "AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"
    ]
    
    // Read Currency List
    func getCurrencies() -> [String] {return currencies}
    
    //MARK:- Networking
    func fetchRate(for currency: String) {
        let urlString = "\(baseUrl)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let sessionError = error {self.delegate?.didFailWithError(sessionError); return}
                guard let sessionData = data else {fatalError("error reading session data")}
                if let rate = self.parseData(sessionData) {
                    self.delegate?.didFetchRate(rate, for: currency)
                }
            }).resume()
        }
    }
    // Parse Data
    private func parseData(_ sessionData: Data) -> Double? {
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode(ParsedData.self, from: sessionData)
            let rate = parsedData.rate
            return rate
        }
        catch {delegate?.didFailWithError(error); return nil}
    }
    
}
