//
//  ViewController.swift
//  QRCodeGen
//
//  Created by Marc Coulange on 4/3/17.
//  Copyright © 2017 VAIL Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var qrcodeImage: CIImage!

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btnAction: UIButton!
    
    @IBOutlet weak var imgQRCode: UIImageView!

    @IBOutlet weak var slider: UISlider!

    @IBAction func performButtonAction(sender: AnyObject) {
        if qrcodeImage == nil {
            if textField.text == "" {
                return
            }
        }
        
        let data = textField.text?.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        
        qrcodeImage = filter?.outputImage
        
        imgQRCode.image = UIImage(ciImage: qrcodeImage)
        
        textField.resignFirstResponder()
        
    }
    
    
    @IBAction func changeImageViewScale(sender: AnyObject) {
       
    }
}

