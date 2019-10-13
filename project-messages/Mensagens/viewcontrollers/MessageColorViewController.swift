//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2019 Rafael Freitas. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func changeColor(_ sender: UIButton) {
        let colorPicker = storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
        
        present(colorPicker, animated: true, completion: nil)
    }
}

