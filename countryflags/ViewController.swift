//
//  ViewController.swift
//  countryflags
//
//  Created by Dennis Chau on 2016-11-18.
//  Copyright © 2016 Dennis Chau. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "countryIdentifier"
    
    let url = "https://restcountries.eu/rest/v1/all"
    var countries: [(name: String, code: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    //print(response)

                    if let JSON = response.result.value {
                        let jsonArray = JSON as? [[String:Any]]
                        for item in jsonArray! {
                            let cname = item["name"]! as! String
                            let ccode = item["alpha2Code"]! as! String
                            self.countries += [(name: cname, code: ccode.lowercased())]
                            self.tableView.insertRows(at: [IndexPath(row: self.countries.count-1, section: 0)], with: .automatic)
                           
                        }
                        
                    }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        let country = countries[indexPath.row]
        
        // Instantiate a cell
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
        
        // Adding the right informations
        cell.textLabel?.text = country.name
        
        // Returning the cell
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // pass country code to FlagViewController
        let flagVC = storyboard?.instantiateViewController(withIdentifier: "flagVC") as! FlagViewController
        flagVC.country = countries[indexPath.row].code
        navigationController?.pushViewController(flagVC, animated: true)    }
}
