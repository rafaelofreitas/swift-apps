//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Rafael Freitas on 13/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbSateTaxes: UILabel!
    @IBOutlet weak var lbStateTaxesDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        let dolar = taxesCalculator.dolar * taxesCalculator.shoppingValue
        lbDolar.text = taxesCalculator.getFormattedValue(of: dolar, withCurrency: "US$ ")
        
        let valueStateTaxesFormatted = taxesCalculator.getFormattedValue(of: taxesCalculator.stateTax, withCurrency: "")
        lbStateTaxesDescription.text = "Imposto do Estado \(valueStateTaxesFormatted)%"
        lbSateTaxes.text = taxesCalculator.getFormattedValue(of: taxesCalculator.stateTaxValue, withCurrency: "$ ")
        
        let valueIOFFormatted = taxesCalculator.getFormattedValue(of: taxesCalculator.iof, withCurrency: "")
        lbIOFDescription.text = "IOF \(valueIOFFormatted)%"
        lbIOF.text = taxesCalculator.getFormattedValue(of: taxesCalculator.iofValue, withCurrency: "US$ ")
        
        let real = taxesCalculator.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = taxesCalculator.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
