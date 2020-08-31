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
    
    // Override View Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // CurrencyPicker DataSource|Delegate
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK:- CurrencyPickerView DataSource|Delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // DataSource Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {}
    
    // Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
}

