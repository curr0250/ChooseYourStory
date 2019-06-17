//
//  ThirdViewController.swift
//  ChoseYourStory
//
//  Created by Jody Curry on 2018-11-07.
//  Copyright © 2018 curr0250@algonquinlive.com. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var NavigationC: UINavigationItem!
    @IBOutlet weak var restartButton: UIBarButtonItem!
    
    //create button action that will unwind the segue back to the original page
    @IBAction func restartButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
     
   
    @IBOutlet weak var TextC: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //create empty page object
var currentPage: Page?
    
    //set up outlets to display current page information
    override func viewWillAppear(_ animated: Bool) {
        self.NavigationC.title = "Page \(currentPage!.pageNumber!)"
       TextC.text = (currentPage!.pageText)
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
