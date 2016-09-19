//
//  LinkedInViewController.swift
//  UsTwo
//
//  Created by Irina Kalashnikova on 9/18/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class LinkedInViewController: UIViewController, UIWebViewDelegate {

    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setWebView()
        
    }
    
    func setWebView(){
        let url = NSURL(string: "https://www.linkedin.com/in/irina-ernst")!
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        webView.loadRequest(NSURLRequest(url: url as URL) as URLRequest)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func setBackButton(){
        let back = UIBarButtonItem(image: #imageLiteral(resourceName: "Back"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = back
        navigationItem.title = "LinkedIn"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonTapped(sender: UIBarButtonItem){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
