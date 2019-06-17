//
//  ViewController.swift
//  ChoseYourStory
//
//  Created by Jody Curry on 2018-11-01.
//  Copyright © 2018 curr0250@algonquinlive.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Navigation: UINavigationItem!
    @IBOutlet weak var ButtonA: UIBarButtonItem!
    @IBOutlet weak var ButtonB: UIBarButtonItem!
   
    //create segues for buttons indicating which pages is it coming from
    @IBAction func pageButtonA(_ sender: Any) {
        performSegue(withIdentifier: "ShowPageB", sender: "ButtonA")
    }
    @IBAction func pageButtonB(_ sender: Any) {
         performSegue(withIdentifier: "ShowPageB", sender: "ButtonB")
    }
    @IBOutlet weak var pageText: UITextView!
    
 
    
   
    var page1: Page? = Page()
    var page2: Page? = Page()
    var page3: Page? = Page()
    var page4: Page? = Page()
    var page5: Page? = Page()
    var page6: Page? = Page()
    var page7: Page? = Page()
    
    var currentPage: Page? = Page()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set current page to 1 to start the story
        currentPage = page1
        
        //connect the page text of the page object to the UITextView page text item
        pageText.text = currentPage?.pageText
        
        //make each of the page objects and assign the text for each
        page1?.pageNumber = 1
        page1!.pageText = "The year is 2020 and humans have arrived on Mars for the first time. In a cave you find a human skeleton and on the wall you see four words carved into the rock..." + "\r\n\n" + "If you see..." + "\n" + " 'Earth, our last hope' then go to page 2." + "\r\n\n" + "If you see..." + "\n" + "'we were never alone' then go to page 3."
        page2?.pageNumber = 2
        page2?.pageText = "You continue deeper into the cave and on the wall you see cave paintings like the ones back home on Earth. They are massive though, covering floor to ceiling of the cave." + "\r\n\n" + "If you see stick people running away from giant animals then go to page 4." + "\r\n\n" +  "If you see the stick people going into a large spaceship then go to page 5."
        page3?.pageNumber = 3
        page3?.pageText = "You back slowly out of the cave, shining your flashlight into the darkness when you trip over something, and as you're falling to the ground you see..." + "\r\n\n" + "if you see a long, sharp leg disappearing behind an outcropping then go to page 6." + "\r\n\n" + "If you see with relief that it's the ladder to your space shuttle then go to page 7"
        page4?.pageNumber = 4
        page4?.pageText = "Your curiosity gets the better of you as you decend deeper into the cave. You finally come to a giant cavern, where there are reminants of huts and walls. You quickly snap a picture quickly. As you look down at the picture, you notice something moving in the shadows. Welcome to Mars."
        page5?.pageNumber = 5
        page5?.pageText = "As you go further down the cave you can see that the pictures now include motorized vehicles, the outlines of a city and other flying contraptions. How did such an advanced society reach apoint that they had to abandon their planet? Then you understand. Their improvements did to Mars what they are doing to Earth. You see our future."
        page6?.pageNumber = 6
        page6?.pageText = "You run as fast as you can back to your shuttle. It feels like running in a nightmare, unable to sprint you are forced to travel in small leaps. You try 'swimming' through the air, struggling. You finally make it to the shuttle, screaming to your crew to take off. A voice you don't recognize replies: 'ah, I see you've met my pet."
        page7?.pageNumber = 7
        page7?.pageText = "You climb the ladder into your shuttle, and initiate take off sequence to return to your space station. You try to radio, but you get no response. It's only as you look out the window that you see your space shuttle still on the surface, as you leave the planet in an exact replica of your ship. "
        
        
         //manually make connections between the nodes of the A-B tree
        page1?.pageChoiceA = page2
        page1?.pageChoiceB = page3
        
        page2?.pageChoiceA = page4
        page2?.pageChoiceB = page5
        
        page3?.pageChoiceA = page6
        page3?.pageChoiceB = page7
        
       
    }
    
    
   
    //create the segue to pass information to the next page depending on which choice they made
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SecondViewController
        
        if sender as! String == "ButtonA" {
            print(sender as! String)
            nextVC.currentPage = self.currentPage?.pageChoiceA
    }
        else if sender as! String == "ButtonB" {
            print(sender as! String)
            nextVC.currentPage = self.currentPage?.pageChoiceB
        }
        
    }
    
    //set the outlets for the page the appropriate current page
    override func viewWillAppear(_ animated: Bool) {
        self.Navigation.title = "Page \(currentPage!.pageNumber!)"
        self.ButtonA.title = "Page \(currentPage!.pageChoiceA!.pageNumber!)"
        self.ButtonB.title = "Page \(currentPage!.pageChoiceB!.pageNumber!)"
        pageText.text = (currentPage!.pageText)
    }
}

