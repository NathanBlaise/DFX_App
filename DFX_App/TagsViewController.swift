//
//  TagsViewController.swift
//  DFX_App
//
//  Created by Nathan Lewis on 10/29/17.
//  Copyright © 2017 Nathan Lewis. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    
    
    
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
    
    var  colorsArray = ["Blue","Green","Red","Purple","Pink","Orange","Black","Yellow","White"]
    
    var clotheSizes = ["XS","S","M","L","XL","XXL","XXXL"]

    @IBOutlet weak var clothingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clothingImage?.image = imageArray[0]
        self.sizePicker.isHidden = true
        self.sizeLabel.isHidden = true
        self.typeTextField.isHidden = true
        self.typeTextField.delegate = self
        self.typeLabel.isHidden = true
        self.colorPicker.isHidden = true
        self.colorLabel.isHidden = true
        self.sizePicker.dataSource = self;
        self.sizePicker.delegate = self;
        self.colorPicker.dataSource = self;
        self.colorPicker.delegate = self;
        let imageData1 = UIImagePNGRepresentation(imageArray[0])
        let base64String1 = imageData1?.base64EncodedData(options: [])
        
        let imageData2 = UIImagePNGRepresentation(imageArray[1])
        let base64String2 = imageData2?.base64EncodedData(options: [])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sizeNotRight(_ sender: Any) {
        self.sizePicker.isHidden = false
        self.sizeLabel.isHidden = false
    }
    
    
    @IBAction func typeNotRight(_ sender: Any) {
        self.typeLabel.isHidden = false
        self.typeTextField.isHidden = false
    }
    
    
    @IBAction func colorNotRight(_ sender: Any) {
        self.colorPicker.isHidden = false
        self.colorLabel.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == sizePicker){
            return clotheSizes.count;
        }
        else {
            return colorsArray.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == sizePicker){
            return clotheSizes[row];
        }
        else {
            return colorsArray[row];
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == sizePicker){
            for i in stride(from: 0, to: clotheSizes.count, by: 1) {
                if(row == i){
                self.sizeLabel.text = clotheSizes[i]
                }
            }
        }
        else {
            for i in stride(from: 0, to: colorsArray.count, by: 1) {
                if(row == i){
                self.colorLabel.text = colorsArray[i]
                }
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        typeTextField.resignFirstResponder()
        self.typeLabel.text = self.typeTextField.text
        return true
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
