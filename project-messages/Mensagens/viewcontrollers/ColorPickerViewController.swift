//
//  ColorPickViewController.swift
//  Mensagens
//
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate: class {
    func applyColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {
    @IBOutlet weak var viColor: UIView!
    @IBOutlet weak var sdRed: UISlider!
    @IBOutlet weak var sdGreen: UISlider!
    @IBOutlet weak var sdBlue: UISlider!
    
    weak var delegate: ColorPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func choseColor(_ sender: UIButton) {
        delegate?.applyColor(color: viColor.backgroundColor!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        viColor.backgroundColor = UIColor(red: CGFloat(sdRed.value), green: CGFloat(sdGreen.value), blue: CGFloat(sdBlue.value), alpha: 1.0)
    }
}
