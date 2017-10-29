//
//  CameraViewController.swift
//  DFX_App
//
//  Created by Nathan Lewis on 10/29/17.
//  Copyright © 2017 Nathan Lewis. All rights reserved.
//

import UIKit
import DKCamera
import Photos

class CameraViewController: UIViewController {
    
    var imageCount = 0
    var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func capture(_ sender: Any) {
        self.imageCount = 0
        self.imageArray.removeAll(keepingCapacity: false)
        let camera = DKCamera()
        camera.didCancel = { () in
            print("didCancel")

            self.dismiss(animated: true, completion: nil)
        }

        camera.didFinishCapturingImage = { (image: UIImage?) in
            print("didFinishCapturingImage")
            self.imageArray.append(image!)
            self.imageCount += 1
            if(self.imageCount == 2){
                self.dismiss(animated: true, completion: {self.performSegue(withIdentifier: "toItem", sender: self)})
            }
        }
        self.present(camera, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toItem") {
            
            let NextViewController = (segue.destination as! TagsViewController)
            NextViewController.imageArray = self.imageArray
        }
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
