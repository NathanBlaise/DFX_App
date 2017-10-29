//
//  TagsViewController.swift
//  DFX_App
//
//  Created by Nathan Lewis on 10/29/17.
//  Copyright © 2017 Nathan Lewis. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {
    
    
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var sizePicker: UIPickerView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeNotRight: UIButton!
    
    @IBOutlet weak var typeButton1: UIButton!
    @IBOutlet weak var typeButton2: UIButton!
    @IBOutlet weak var typeButton3: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var typeNotRight: UIButton!
    
    @IBOutlet weak var colorButton1: UIButton!
    @IBOutlet weak var colorButton2: UIButton!
    @IBOutlet weak var colorButton3: UIButton!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var colorNotRight: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    var imageArray: [UIImage] = []

    @IBOutlet weak var clothingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clothingImage?.image = imageArray[0]
        self.sizePicker.isHidden = true
        self.sizeLabel.isHidden = true
        self.typeTextField.isHidden = true
        self.typeLabel.isHidden = true
        self.colorPicker.isHidden = true
        // Do any additional setup after loading the view.
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
