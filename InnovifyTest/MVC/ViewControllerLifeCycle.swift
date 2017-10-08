//
//  ViewControllerLifeCycle.swift
//  InnovifyTest
//
//  Created by jetani kalpesh on 08/10/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import UIKit

class ViewControllerLifeCycle: InnovifyLocalizationController {
    
    @IBOutlet var buttonPresentINewnstance: UIButton!
    @IBOutlet var buttonDismiss: UIButton!
    
    
    static var counter : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View Did Load : \(title ?? "No title")")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear : \(title ?? "No title")")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear : \(title ?? "No title")")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear : \(title ?? "No title")")
    }
    
    deinit {
        print("ViewController DEINIT : \(title ?? "No title")")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("ViewController Memory Warning : \(title ?? "No title")")
    }
    

    // MARK: - Navigation
    @IBAction func buttonPresentNewInstancePressed() {
        
        let newInstance = storyboard!.instantiateViewController(withIdentifier: "ViewControllerLifeCycle")
        newInstance.title = " > Controller \(ViewControllerLifeCycle.counter)"
        ViewControllerLifeCycle.counter = ViewControllerLifeCycle.counter + 1
        self.present(newInstance, animated: true, completion: nil)
    }
    
    @IBAction func buttonDismissSelfPressed() {
        
        self.dismiss(animated: true, completion: {
            ViewControllerLifeCycle.counter = ViewControllerLifeCycle.counter - 1
        })
    }
    //MARK:- Localization
    override func localizeUIComponents(){
        buttonPresentINewnstance.setTitle("Present New Instance".localized(), for: UIControlState.normal)
        buttonDismiss.setTitle("Dismiss".localized(), for: UIControlState.normal)
    }

}
