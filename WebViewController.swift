//
//  WebViewController.swift
//  style-shaker
//
//  Created by Jordan Marques on 13/07/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var request: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request = request.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        let urlString: String = "https://www.google.fr/search?q=" + request
        
        let url = NSURL (string: urlString);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
