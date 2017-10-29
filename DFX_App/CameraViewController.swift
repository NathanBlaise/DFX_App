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
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var images: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for image in self.images{
            image.isHidden = true
        }
        continueButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func capture(_ sender: Any) {
        self.imageCount = 0
        let camera = DKCamera()
        camera.didCancel = { () in
            print("didCancel")

            self.dismiss(animated: true, completion: nil)
        }

        camera.didFinishCapturingImage = { (image: UIImage?) in
            print("didFinishCapturingImage")
            self.imageArray.append(image!)
            self.images.remove(at: self.imageCount).image = image
            self.imageCount += 1
            if(self.imageCount == 2){
                self.dismiss(animated: true, completion: nil)
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
    
    @IBAction func continueToNext(_ sender: Any) {
        self.performSegue(withIdentifier: "toItem", sender: self)
    }
    
    func hideEverything(){
        for label in self.labels {
            label.isHidden = true
        }
        startButton.isHidden = true
        for image in self.images{
            image.isHidden = false
        }
        continueButton.isHidden = false
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
