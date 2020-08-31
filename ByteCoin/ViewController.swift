//
//  ViewController.swift
//  ByteCoin
//
//  Created by Nishant Taneja on 31/08/20.
//  Copyright © 2020 Nishant Taneja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    // Initialise
    private var coinManager = CoinManager()
    private var currencies = [String]()
    
    // Override View Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // CurrencyPicker DataSource|Delegate
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        // CoinManagerDelegate
        coinManager.delegate = self
        currencies = coinManager.getCurrencies()
    }
}

//MARK:- CurrencyPickerView DataSource|Delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // DataSource Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return currencies.count}
    // Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return currencies[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchRate(for: currencies[row])
    }
}

//MARK:- CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didFetchRate(_ rate: Double, for currency: String) {
        DispatchQueue.main.async {
            self.rateLabel.text = String(format: "%.2f", rate)
            self.currencyLabel.text = currency
        }
    }
    func didFailWithError(_ error: Error) {print(error)}
}
