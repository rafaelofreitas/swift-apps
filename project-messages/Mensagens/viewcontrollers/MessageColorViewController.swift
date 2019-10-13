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
        
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ScreenColorViewController
        vc.message = message
    }
}

extension MessageColorViewController: ColorPickerDelegate {
    func applyColor(color: UIColor) {
        lbMessage.backgroundColor = color
        message.backgroundColor = color
    }
}
