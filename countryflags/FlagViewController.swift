//
//  FlagViewController.swift
//  countryflags
//
//  Created by arcui on 2016-11-19.
//  Copyright © 2016 Dennis Chau. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FlagViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    var country = ""
    let urlStart = "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/"
    let ext = ".png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = urlStart+country+ext
        
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value{
                self.imageView.image = image
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
