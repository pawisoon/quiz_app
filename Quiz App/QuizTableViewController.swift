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
        //loadSampleQuizes()
        if quizes.isEmpty{
            print("no quizes")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
        

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

    @IBAction func refresh_quizes_list(sender: AnyObject) {
        
        getQuizes("http://quiz.o2.pl/api/v1/quizzes/0/100") { (succeeded: Bool, count: Int, json_dict: NSDictionary) -> () in
            if(succeeded) {
                print("ok")
                //... count
                for i in 0...2{
                    if let q_id = json_dict["items"]![i]["id"] {
                        let no_questions = json_dict["items"]![i]["questions"] as! Int
                        self.getQuizById(q_id as! Int){ (succeeded: Bool, q_json_dict: NSDictionary) -> () in
                            for a in 0...1{
                                print(q_json_dict["questions"]![a]["text"] as! String)
                                print(q_json_dict["questions"]![a]["answers"]!![0]["text"])
                                print(q_json_dict["questions"]![a]["answers"]!![1]["text"])
                                print(q_json_dict["questions"]![a]["answers"]!![2]["text"])
                                print(q_json_dict["questions"]![a]["answers"]!![3]["text"])
//                                let photo2 = UIImage(named: "defaultphoto_2x")!
//                                let quiz = Quiz(title: q_json_dict["questions"]![a]["text"] as! String,status: "In progress: 40%", quiz_pic: photo2)!
//                                self.quizes += [quiz]
//                                self.tableView.reloadData()
                                
                            }
                        }
                    }
                    
                }
                
            }
            
            
        }
        quizes.removeAll()
        loadSampleQuizes()
        tableView.reloadData()
        
    }
    
    func getQuizes(url : String, postCompleted : (succeeded: Bool, count: Int, json_dict: NSDictionary) -> ()){
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)
                    
                    
                    let json2 = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
//
                    let count = json["count"] as! Int
                    
//                    if let category = json["items"]!![1]["category"]!!["name"] as? String {
//                        print(category)
//                    }
//                    if let additional_info = json["items"]!![1]["title"] as? String {
//                        print(additional_info)
//                    }
//                    if let photo_url = json["items"]!![1]["mainPhoto"]!!["url"] as? String {
//                        print(photo_url)
//                    }
//                    if let no_questions = json["items"]!![1]["questions"] as? String {
//                        print(no_questions)
//                    }
//                    if let question_id = json["items"]!![1]["id"] as? String {
//                        print(question_id)
//                    }
                    
                    
                    postCompleted(succeeded: true, count: count, json_dict: json2!)
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        task.resume()
    }
    
    func getQuizById(id: Int, postCompleted : (succeeded: Bool, q_json_dict: NSDictionary) -> ()){
        let url = "http://quiz.o2.pl/api/v1/quiz/"+String(id)+"/0"
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Quiz dowloaded")
                
                do{
                    
                    let json2 = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary

                    postCompleted(succeeded: true, q_json_dict: json2!)
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        task.resume()
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
