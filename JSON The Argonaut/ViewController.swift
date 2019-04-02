//
//  ViewController.swift
//  JSON The Argonaut
//
//  Created by Michael Rogers on 10/31/17.
//  Copyright © 2017 Michael Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataFetcher:CurrencyFetcher!
    
    @IBOutlet weak var conversionLBL: UILabel!
    @IBOutlet weak var currencyTF: UITextField!
    
    @IBAction func fetchRates(_ sender: Any) {
        dataFetcher.fetchExchangeRates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFetcher = CurrencyFetcher()
        NotificationCenter.default.addObserver(self, selector:#selector(currencyDelivered(notification:)),name: NSNotification.Name(rawValue:"breaking news - currency"), object:nil)
    }

   @objc func currencyDelivered(notification:Notification){
      let currency = notification.object as! Double
        print("Here ya go: \(currency)")
        // self.conversionLBL.text = "\(currency)" // uh, oh ... sounds like a hob for
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

