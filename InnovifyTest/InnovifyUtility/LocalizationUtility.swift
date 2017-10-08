//
//  LocalizationUtility.swift
//  InnovifyTest
//
//  Created by jetani kalpesh on 08/10/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import Foundation
import UIKit

class InnovifyLocalizationController : UIViewController {
    
    var currentLanguageCode : String {
        get{
            return (UserDefaults.standard.value(forKey: "AppLanguage") as? String) ?? Locale.current.languageCode ?? "en"
        }
        set{
            setLocalization(lang: newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.init("AppLanguageChanged"), object: nil, queue: OperationQueue.main) { (notification) in
            self.localizeUIComponents()
        }
        
        localizeUIComponents()
    }
    
    static func setLocalization(lang : String){
        
        let systemLanguage = Locale.current.languageCode
        
        print("System language code is ", systemLanguage ?? "--", ", While selected laguage code is ", lang)

        UserDefaults.standard.set(lang, forKey: "AppLanguage")
        UserDefaults.standard.synchronize()
        
        //let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        //let bundle = Bundle(path: path!)
        //bundle!.load()
        //print("Localizaitons ==>> \(bundle!.localizations)")
        //print("Loaded Bundle Path ==> ",bundle?.bundlePath ?? "Invalid Bundle")
        
        NotificationCenter.default.post(name: NSNotification.Name.init("AppLanguageChanged"), object: nil)
    }
    
    private func setLocalization(lang : String){
        InnovifyLocalizationController.setLocalization(lang: lang)
    }
    
    func localizeUIComponents(){
        print("InnovifyLocalizationController > Localized")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


extension String {
    
    func localized() -> String? {
        if let lang : String = UserDefaults.standard.value(forKey: "AppLanguage") as? String,
            let path = Bundle.main.path(forResource: lang, ofType: "lproj") {
            
            if let bundle = Bundle(path: path) {
                let string = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
                print("string \(self) :<\(lang)>: \(string)")
                return string
            }
            
        }
        
        return nil;
    }
}
