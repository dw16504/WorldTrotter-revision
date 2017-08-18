//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Douglas D. Webb on 8/18/17.
//  Copyright © 2017 Douglas D. Webb. All rights reserved.
//

import UIKit

class ConversionViewController :UIViewController{
    //sets the variable for the output
    @IBOutlet var output :UILabel!
    //sets the variable for the text field
    @IBOutlet var inputField :UITextField!
    // sets the value for fahrenheight when it is updated
    var fahrenheitValue :Measurement<UnitTemperature>?{
        didSet{
            updateOutput()
        }
    }
    
    var celsiusValue :Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue{
        return fahrenheitValue.converted(to: .celsius)
        }
        else
        {
        return nil
        }
    }
    
    
    
    func updateOutput(){
        if let celsiusValue = celsiusValue{
            output.text = "\(celsiusValue)";
        }
        else{
            output.text = "nope"
            }
        }

        
    
    
    
    
    
    @IBAction func input (_textField: UITextField){
        
        if let text = _textField.text , let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }else{
            fahrenheitValue = nil;
        
            }
        }
    
    @IBAction func main (_sender: UITapGestureRecognizer){
        
        print ("the screen was tepped");
        inputField.resignFirstResponder();
        //updateOutput();
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("the view loaded!")
        updateOutput()
        }
    
    
    
    
    
}
