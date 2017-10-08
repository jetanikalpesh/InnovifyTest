//
//  ViewController.swift
//  InnovifyTest
//
//  Created by jetani kalpesh on 08/10/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import UIKit

class ViewController: InnovifyLocalizationController {

    @IBOutlet var buttonSaveUser : UIButton!
    @IBOutlet var buttonRetriveUser : UIButton!
    @IBOutlet var btnLifecycle: UIButton!
    @IBOutlet var buttonChangeLanguage : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueLifecycle"{
            segue.destination.title = "First"
            ViewControllerLifeCycle.counter = 0
        }
    }
    
    //MARK:- Action
    @IBAction func buttonSaveUserPressed(){
        
        //CASE 1
        let user1 = ModelUserInfo.init()
        user1.id = "user1"
        user1.emailAddress = "user1@innovify.com"
        user1.firstName = "user"
        user1.lastName = "1"
        do {
            try user1.save()
            print("User Saved : ", user1.id!)
        }
        catch (let error as InnovifyTestError){
            error.printError()
        }catch {
            print("\(error.localizedDescription)")
        }
        
        //OR
        //CASE 2 if you are sure it will succeed then use "try!"
        try! user1.save()

        
        //CASE 3
        let user2 = ModelUserInfo()
        
        do {
            try user2.save()
            print("User Saved : ", user2.id!)
        }
        catch (let error as InnovifyTestError){
            error.printError()
        }catch {
            print("\(error.localizedDescription)")
        }
        //OR
        //CASE 4 if you want to ignore Do-try-Catch call then try using "try?"
        try? user2.save()
        
    }
    
    @IBAction func buttonRetriveUserPressed(){
        
        //CASE Retrive Data 1
        let retriveUser1 = ModelUserInfo.loadIfSaved(userid: "user1")
        if let email = retriveUser1?.emailAddress{
            print("retrived 1: ", email)
        }
        
        //CASE Retrive Data 2
        let retriveUser2 = ModelUserInfo.loadIfSaved(userid: "user2")
        print("retrived 2 : ", retriveUser2?.emailAddress ?? "No value found")
    }
    
    
    @IBAction func buttonChangeLanguagePressed() {

        if self.currentLanguageCode == "en"{
            self.currentLanguageCode = "hi"
        }else{
            self.currentLanguageCode = "en"
        }
    }
    
    //MARK:- Localization
    override func localizeUIComponents(){
        
        buttonSaveUser.setTitle("Save User".localized(), for: UIControlState.normal)
        buttonRetriveUser.setTitle("Load User".localized(), for: UIControlState.normal)
        btnLifecycle.setTitle("ViewController lifecycle test".localized(), for: UIControlState.normal)
        buttonChangeLanguage.setTitle("change language".localized(), for: UIControlState.normal)

    }
    
}

