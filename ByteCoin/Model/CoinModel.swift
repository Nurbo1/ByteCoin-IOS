//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Нурбол Мухаметжан on 10.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel{
    let currency: Double
    var currencyString:String{
        return String(format: "%.2f", currency)
    }
}
