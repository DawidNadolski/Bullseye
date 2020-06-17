//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Dawid Nadolski on 29/04/2020.
//  Copyright © 2020 Dawid Nadolski. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func closeAboutScreen() {
        dismiss(animated: true, completion: nil)
    }
}
