//
//  QuizTableViewController.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 28/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuizTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Properties
    
    var quizes = [Quiz]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView!.delegate = self
        tableView!.dataSource = self
        loadSampleQuizes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleQuizes() {
        
        let photo1 = UIImage(named: "defaultphoto_2x")!
        let quiz1 = Quiz(title: "Quiz 1",status: "Finished: 100%", quiz_pic: photo1)!
        
        let photo2 = UIImage(named: "defaultphoto_2x")!
        let quiz2 = Quiz(title: "Quiz 2",status: "In progress: 40%", quiz_pic: photo2)!
        
        let photo3 = UIImage(named: "defaultphoto_2x")!
        let quiz3 = Quiz(title: "Quiz 3",status: "Not started.", quiz_pic: photo3)!
        
        quizes += [quiz1, quiz2, quiz3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quizes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quiz_cell", forIndexPath: indexPath) as! QuizTableViewCell
        let quiz = quizes[indexPath.row]
        
        cell.title.text = quiz.title
        cell.quiz_pic.image = quiz.quiz_pic
        cell.status.text = quiz.status

        return cell
    }
    
    @IBAction func unwindToQuizesList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? QuizViewController, quiz = sourceViewController.quiz {
            
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                quizes[selectedIndexPath.row] = quiz
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                
                
            }
            else{
                // Add a new meal.
                let newIndexPath = NSIndexPath(forRow: quizes.count, inSection: 0)
                quizes.append(quiz)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuiz" {
            let quizDetailViewController = segue.destinationViewController as! QuizViewController
            
            if let selectedQuizCell = sender as? QuizTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedQuizCell)!
                let selectedQuiz = quizes[indexPath.row]
                quizDetailViewController.quiz = selectedQuiz
                
                
            }
            
            
        }

    }
 

}
