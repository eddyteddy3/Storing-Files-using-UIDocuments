//
//  ViewController.swift
//  UIDocument Store
//
//  Created by Moazzam Tahir on 03/09/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var doc: CustomDocument?
    var urlToDocPath: URL?
    
    let fileMng = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveToDoc()
    }
    
    func saveToDoc() {
        let docsDir = fileMng.urls(for: .documentDirectory, in: .userDomainMask)
        
        urlToDocPath = docsDir[0].appendingPathComponent("saveText.txt")
        if let url = urlToDocPath {
            doc = CustomDocument(fileURL: url)
            doc?.userCustomString = ""
            
            if fileMng.fileExists(atPath: url.path) {
                doc?.open(completionHandler: { (success) in
                    if success {
                        print("File Opened!")
                        self.textView.text = self.doc?.userCustomString
                    }
                })
            } else {
                doc?.save(to: url, for: .forCreating, completionHandler: { (success) in
                    if success {
                        print("New file created!")
                        
                    }
                })
            }
        }
    }

    @IBAction func saveDoc(_ sender: Any) {
    }
    
}

