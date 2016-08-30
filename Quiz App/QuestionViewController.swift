//
//  QuestionViewController.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 30/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    var question:Question?
    var picker_numbers = [["a1","a2","a3","a4"]];
    @IBOutlet weak var q_title: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        q_title.title = question?.question



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return picker_numbers.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_numbers[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker_numbers[component][row]
    }

}
