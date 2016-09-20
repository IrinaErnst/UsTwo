//
//  WebViewController.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/18/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    var webView: UIWebView!
    var url: NSURL!
    var name: String!
    var backButton: UIButton!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var backNavBar: UINavigationItem!
    var toRepos: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setWebView()
    }
    
    func setNavBar() {
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        navBar.topItem?.title = name
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navBar.barStyle = .blackTranslucent
        view.addSubview(navBar)
        setBackButton()
    }
    

    func setWebView(){
        if name == "Linked In" {
            url = NSURL(string: "https://www.linkedin.com/in/irina-ernst")!
        } else if name == "Github" {
            url = NSURL(string: "https://github.com/IrinaErnst")!
        } else if name == "Blog"{
            url = NSURL(string: "https://medium.com/@irinaernst")!
        } else {
            url = NSURL(string: "https://www.google.com/")!
        }
        webView = UIWebView(frame: CGRect(x: 0, y: 65, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-65))
        webView.loadRequest(NSURLRequest(url: url as URL) as URLRequest)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func setBackButton(){
        let back = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButtonTapped))
        backNavBar.leftBarButtonItem = back
        
        //if name == "Github"{
        //    let repos = UIBarButtonItem(title: "Repos >", style: .plain, target: self, action: #selector(reposButtonTapped))
        //    backNavBar.rightBarButtonItem = repos
        //}
        
        navBar.items = [backNavBar]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func backButtonTapped(sender: UIBarButtonItem){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reposButtonTapped(sender: UIBarButtonItem){
        
        let reposVC = ReposTableViewController()
        
        // TODO: do any setup you need for reposVC
        present(reposVC, animated: true, completion: nil)
        
//        [self presentModalViewController:myNewVC animated:YES];
//        self.performSegue(withIdentifier: "reposSegue", sender: sender)
    }

}
