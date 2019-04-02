//
//  DataFetcher.swift
//  JSON The Argonaut
//
//  Created by Michael Rogers on 10/31/17.
//  Copyright © 2017 Michael Rogers. All rights reserved.
//

import Foundation


class CurrencyFetcher {
    
    let openExchangeRatesAPI = "6307804b17ea4dbb8d51629a2d298d26"
    
    var openExchangeRatesURL:String = ""
    
    // called to start the currency fetching process
    func fetchExchangeRates() -> Void {
        openExchangeRatesURL = "https://openexchangerates.org/api/latest.json?app_id=\(openExchangeRatesAPI)"
        print(openExchangeRatesURL)
        let urlSession = URLSession.shared
        let url = URL(string: openExchangeRatesURL)
        urlSession.dataTask(with: url!, completionHandler: displayRates).resume()
    }
    
    // callback function, once the URL has completed
    func displayRates(data:Data?, urlResponse:URLResponse?, error:Error?)->Void {
        var exchangeRates:[String:Any]!
        do {
            try exchangeRates = JSONSerialization.jsonObject(with: data!, options: .allowFragments)  as?  [String:Any]
            if exchangeRates != nil {
                let allRates = exchangeRates["rates"] as? [String:Double]
                let canadianRate = allRates!["CAD"]!
                print(canadianRate)
                // extract the currency for either INR or CAD or any other country of your choice
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"breaking news - currency"), object: canadianRate)
            }
         } catch {
            print(error)
        }

    }
}
