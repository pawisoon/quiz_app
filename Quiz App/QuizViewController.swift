//
//  ViewController.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 27/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var navigation_quiz_title: UINavigationItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var progressbar: UIProgressView!
    
    var quiz:Quiz?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let quiz = quiz {
            navigation_quiz_title.title = quiz.title
        }
        navigation_quiz_title.title = quiz?.title
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Navigation
    
    // configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
           print("saving seque")
            
        }
    }

    //go back to quiz list and cancel current one
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddReceiptMode = presentingViewController is UINavigationController
        
        
        if isPresentingInAddReceiptMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else{
            navigationController!.popViewControllerAnimated(true)
        }
    }
    

}

