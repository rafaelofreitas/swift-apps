//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Rafael Freitas on 13/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAmmount()
    }
    
    func setAmmount() {
        taxesCalculator.shoppingValue = taxesCalculator.convertToDouble(tfDolar.text!)
        
        let value = taxesCalculator.dolar * taxesCalculator.shoppingValue
        lbReal.text = taxesCalculator.getFormattedValue(of: value, withCurrency: "R$ ")
        
        let dolar = taxesCalculator.getFormattedValue(of: taxesCalculator.dolar, withCurrency: "$ ")
        lbRealDescription.text = "Valor sem impostos (dólar: \(dolar))"
    }
}

