//
//  SecondViewController.swift
//  ChoseYourStory
//
//  Created by Jody Curry on 2018-11-07.
//  Copyright © 2018 curr0250@algonquinlive.com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var NavigationB: UINavigationItem!
    
   //as in page 1, create segues which indicate who the sender is
    @IBOutlet weak var ButtonA: UIBarButtonItem!
    @IBAction func pageButtonA(_ sender: Any) {
        performSegue(withIdentifier: "ShowPageC", sender: "ButtonA")
    }
    
    
    @IBOutlet weak var ButtonB: UIBarButtonItem!
    @IBAction func pageButtonB(_ sender: Any) {
        performSegue(withIdentifier: "ShowPageC", sender: "ButtonB")
    }
    @IBOutlet weak var TextB: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //create an empty page object to hold the information that is passed to it
    var currentPage: Page?
    
    
    //same as on page 1, create segue to pass information correct page depending on what they chose
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC2 = segue.destination as! ThirdViewController
    
        
        if sender as! String == "ButtonA" {
            print(sender as! String)
            nextVC2.currentPage = self.currentPage?.pageChoiceA
        }
        else if sender as! String == "ButtonB" {
            print(sender as! String)
            nextVC2.currentPage = self.currentPage?.pageChoiceB
        }
    }
    
    //as in page 1, determine what is to be displayed in the outlets
    override func viewWillAppear(_ animated: Bool) {
            self.NavigationB.title = "Page \(currentPage!.pageNumber!)"
            self.ButtonA.title = "Page \(currentPage!.pageChoiceA!.pageNumber!)"
            self.ButtonB.title = "Page \(currentPage!.pageChoiceB!.pageNumber!)"
            TextB.text = (currentPage!.pageText)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */





