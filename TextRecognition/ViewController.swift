//
//  ViewController.swift
//  TextRecognition
//
//  Created by Training on 23/10/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = UIImage(named: "demoText")?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
            
        }
        
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

