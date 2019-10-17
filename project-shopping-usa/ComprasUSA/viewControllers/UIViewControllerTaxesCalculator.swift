//
//  UIViewControllerTaxesCalculator.swift
//  ComprasUSA
//
//  Created by Rafael Freitas on 16/10/19.
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

extension UIViewController {
    var taxesCalculator: TaxesCalculator {
        return TaxesCalculator.shared
    }
}
