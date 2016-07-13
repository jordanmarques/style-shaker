//
//  DetailViewController.swift
//  style-shaker
//
//  Created by Jordan Marques on 12/07/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var longTitle: UILabel!
    @IBOutlet weak var detailDescritpion: UILabel!
    
    let DETAIL_TO_WEB = "DetailToWeb"
    
    var post: Post = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longTitle.text = post.title
        detailDescritpion.text = post.about
        
        if let url = NSURL(string: self.post.picture) {
            if let data = NSData(contentsOfURL: url) {
                detailImage.image = UIImage(data: data)
            }
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func buyBtnAction(sender: AnyObject) {
        self.performSegueWithIdentifier(DETAIL_TO_WEB, sender: post.title)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: WebViewController = segue.destinationViewController as! WebViewController
        controller.request = post.title
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
