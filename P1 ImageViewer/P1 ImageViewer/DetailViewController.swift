//
//  DetailViewController.swift
//  P1 ImageViewer
//
//  Created by Lithogen on 3/12/17.
//  Copyright © 2017 Lithogen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // weak refers to we don't want to own obj in memory
    // the view owns the obj
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Displays current image title name at navi bar.  title and selectedImage are both optional strings (nil by default)
        title = selectedImage
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Tell my parent data type that these methods were called
        // Passes to UIViewController which may do its own processing
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
