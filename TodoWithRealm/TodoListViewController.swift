//
//  TodoListViewController.swift
//  TodoWithRealm
//
//  Created by park kyung suk on 2017/08/23.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todoList: Results<Todo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
        do {
            let realm = try Realm()
            todoList = realm.objects(Todo.self)
            tableView.reloadData()
        } catch {
    
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
          
            do {
                let realm = try Realm()
                try realm.write {
                realm.delete(self.todoList[indexPath.row])
                }
            } catch {
                
            }
            tableView.reloadData()
        }
    }
    
    
    
    
}

