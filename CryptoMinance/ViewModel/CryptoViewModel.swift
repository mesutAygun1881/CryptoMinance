//
//  CryptoViewModel.swift
//  CryptoMinance
//
//  Created by mesutAygun on 1.04.2021.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrenctList : [CryptoCurrency]
    
    func numberOfRowsSection() -> Int {
        return self.cryptoCurrenctList.count
    }
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrenctList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
 
}



struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
