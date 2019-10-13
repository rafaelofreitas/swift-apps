//
//  ColorPickViewController.swift
//  Mensagens
//
//  Created by Rafael Freitas on 13/10/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {
    @IBOutlet weak var viColor: UIView!
    @IBOutlet weak var sdRed: UISlider!
    @IBOutlet weak var sdGreen: UISlider!
    @IBOutlet weak var sdBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func choseColor(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        viColor.backgroundColor = UIColor(red: CGFloat(sdRed.value), green: CGFloat(sdGreen.value), blue: CGFloat(sdBlue.value), alpha: 1.0)
    }
}
