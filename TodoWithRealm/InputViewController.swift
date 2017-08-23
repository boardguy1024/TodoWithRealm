//
//  InputViewController.swift
//  TodoWithRealm
//
//  Created by park kyung suk on 2017/08/23.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundingAddButton()
        
    }
    
    private func roundingAddButton() {
        addButton.layer.cornerRadius = 5
        addButton.layer.masksToBounds = true
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        if let todoText = inputTextField.text {
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(Todo(value: ["title": todoText]))
                    print("Todo saved")
                }
            } catch {
                print("save is failed")
            }
            
        } else {
            print("please input your todo text!")
        }
    }
}

extension InputViewController: UITextFieldDelegate {
    
}
