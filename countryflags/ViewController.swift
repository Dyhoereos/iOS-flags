//
//  ViewController.swift
//  countryflags
//
//  Created by Dennis Chau on 2016-11-18.
//  Copyright © 2016 Dennis Chau. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    let url = "https://restcountries.eu/rest/v1/all"
    var countries: [(name: String, code: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)

                    if let JSON = response.result.value {
                        let jsonArray = JSON as? [[String:Any]]
                        for item in jsonArray! {
                            let cname = item["name"]! as! String
                            let ccode = item["alpha2Code"]! as! String
                            self.countries += [(name: cname, code: ccode.lowercased())]
                           
                        }
                    }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
