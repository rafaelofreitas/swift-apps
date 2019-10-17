//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Rafael Freitas on 13/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfSateTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = taxesCalculator.getFormattedValue(of: taxesCalculator.dolar, withCurrency: "")
        tfIOF.text = taxesCalculator.getFormattedValue(of: taxesCalculator.iof, withCurrency: "")
        tfSateTaxes.text = taxesCalculator.getFormattedValue(of: taxesCalculator.stateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        taxesCalculator.dolar = taxesCalculator.convertToDouble(tfDolar.text!)
        taxesCalculator.iof = taxesCalculator.convertToDouble(tfIOF.text!)
        taxesCalculator.stateTax = taxesCalculator.convertToDouble(tfSateTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
