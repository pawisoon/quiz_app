//
//  QuestionsTableViewController.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 30/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var questions = [Question]()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView!.delegate = self
        tableView!.dataSource = self
        
        let photo1 = UIImage(named: "defaultphoto_2x")!
        let q1 = Question(question: "What? 1",status: true, q_pic: photo1, a1:"a1", a2:"a2", a3:"a3", a4:"a4")!
        
        let photo2 = UIImage(named: "defaultphoto_2x")!
        let q2 = Question(question: "What? 2",status: true, q_pic: photo2, a1:"a1", a2:"a2", a3:"a3", a4:"a4")!
        
        let photo3 = UIImage(named: "defaultphoto_2x")!
        let q3 = Question(question: "What? 3",status: true, q_pic: photo3, a1:"a1", a2:"a2", a3:"a3", a4:"a4")!
        
        let photo4 = UIImage(named: "defaultphoto_2x")!
        let q4 = Question(question: "What? 4",status: true, q_pic: photo4, a1:"a1", a2:"a2", a3:"a3", a4:"a4")!
        
        questions += [q1, q2, q3, q4]

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return questions.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuestion" {
            let questionDetailViewController = segue.destinationViewController as! QuestionViewController
            
            if let selectedQuestionCell = sender as? QuestionTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedQuestionCell)!
                let selectedQuestion = questions[indexPath.row]
                questionDetailViewController.question = selectedQuestion
                
                
            }
            
            
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("question_cell", forIndexPath: indexPath) as! QuestionTableViewCell

        
        let question = questions[indexPath.row]
        
        cell.question_no.text = question.question


        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
