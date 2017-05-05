//
//  ViewController.swift
//  P1 ImageViewer
//
//  Created by Lithogen on 3/7/17.
//  Copyright © 2017 Lithogen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title for navigation controller to show at the top
        title = "Storm Viewer"
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            
            if (item.hasPrefix("nssl")) {
                pictures.append(item)
            }
        }
        
        print(pictures)
        print("Hello")
        
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and type casting it into DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2: Success!
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push onto navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

