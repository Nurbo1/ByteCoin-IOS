//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
// Do any additional setup after loading the view.
    }
}

extension ViewController: CoinManagerDelegate{
    func didFail(error: Error) {
        print(error)
    }
    func didUpdateCurrency(coinModel: CoinModel) {
        DispatchQueue.main.async {
            self.resultLabel.text = String(format: "%.2f",coinModel.currency)            }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.stockSymbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.stockSymbols[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = coinManager.stockSymbols[row]
        coinManager.fetchData(symbol: selectedValue)
    }
    
}
