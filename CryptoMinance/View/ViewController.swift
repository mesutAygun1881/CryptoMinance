//
//  ViewController.swift
//  CryptoMinance
//
//  Created by mesutAygun on 1.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    var colorArray = [UIColor]()
    private var cryptoListViewModel : CryptoListViewModel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorArray = [ UIColor(red: 75/255, green: 10/255, blue: 10/255, alpha: 1.0),
        UIColor(red: 95/255, green: 30/255, blue: 150/255, alpha: 1.0),
        UIColor(red: 25/255, green: 90/255, blue: 10/255, alpha: 1.0),
        UIColor(red: 115/255, green: 100/255, blue: 150/255, alpha: 1.0),
        UIColor(red: 185/255, green: 120/255, blue: 50/255, alpha: 1.0),
        UIColor(red: 200/255, green: 170/255, blue: 15/255, alpha: 1.0),
        ]
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
      getData()
        }
    
    func getData () {
         
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel  = CryptoListViewModel(cryptoCurrenctList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        
    }


}

}

