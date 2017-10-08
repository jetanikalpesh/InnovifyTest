//
//  ModelUserInfo.swift
//  InnovifyTest
//
//  Created by jetani kalpesh on 08/10/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import UIKit

class ModelUserInfo: NSObject, NSCoding {
    
    struct Keys {
        static let id           = "id"
        static let firstName    = "firstName"
        static let lastName     = "lastName"
        static let emailAddress = "emailAddress"
    }
    
    var id : String?
    var firstName : String?
    var lastName : String?
    var emailAddress : String?
    
    //Default constructor is required.
    override init() {
        
    }
    
    //Overloaded Constructor
    init(userid: String?, firstName: String?, lastName: String, emailAddress:String?) {
        super.init()
        self.id = userid
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
    }
    
    //MARK:- NSCoding Protocol used to archive object
    required init?(coder aDecoder: NSCoder) {
        
        guard let userid = aDecoder.decodeObject(forKey: ModelUserInfo.Keys.id) as? String else{
            
            return nil
        }
        self.id = userid
        
        self.firstName = aDecoder.decodeObject(forKey: ModelUserInfo.Keys.firstName) as? String
        self.lastName = aDecoder.decodeObject(forKey: ModelUserInfo.Keys.lastName) as? String
        self.emailAddress = aDecoder.decodeObject(forKey: ModelUserInfo.Keys.emailAddress) as? String
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: ModelUserInfo.Keys.id)
        aCoder.encode(firstName, forKey: ModelUserInfo.Keys.firstName)
        aCoder.encode(lastName, forKey: ModelUserInfo.Keys.lastName)
        aCoder.encode(emailAddress, forKey: ModelUserInfo.Keys.emailAddress)
    }
    
    //MARK:- Load Model Object
    static func loadIfSaved(userid: String?) ->ModelUserInfo?{
        
        guard let userid : String = userid else{
            return nil
        }
        
        if let savedData = UserDefaults.standard.object(forKey: "ModelUserInfo_\(userid)") as? Data,
            let object = NSKeyedUnarchiver.unarchiveObject(with: savedData) as? ModelUserInfo {
            return object
        }
        return nil
    }
    
    //MARK:- Save Model Object
    func save() throws {
        
        guard let userid : String = self.id else {
            throw(InnovifyTestError.errorMessage("Invalid user_id"))
        }

        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(data, forKey: "ModelUserInfo_\(userid)")
        UserDefaults.standard.synchronize()
    }
}
