//
//  CustomDocument.swift
//  UIDocument Store
//
//  Created by Moazzam Tahir on 03/09/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import UIKit

//we cannot directly use UIDocument class, this is why it is necassary to create subclass of UIDocument class

class CustomDocument: UIDocument {

    var userCustomString: String? = "This is test to create the user custom string."
    
    //this method will the user data from UITextField
    override func contents(forType typeName: String) throws -> Any {
        if let contents = userCustomString {
            let length = contents.lengthOfBytes(using: String.Encoding.utf8)
            return NSData(bytes: contents, length: length)
        } else {
            return Data()
        }
    }
    
    
    
}
