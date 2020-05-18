//
//  TodoTableTableViewController.swift
//  SimpleTodoApp
//
//  Created by Cornerstone on 2020-05-17.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class UITodoTableViewController: UITableViewController {
    
    @IBOutlet var deleteButton: UIBarButtonItem!
    @IBOutlet var addButton: UIBarButtonItem!
    
    var priorities = [Priority: [Todo]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        initializePriorities()
    }
    
    func initializePriorities() {
        priorities[.high] = [Todo(title: "Study iOS", priority: .high)]
        priorities[.medium] = [Todo(title: "Clean home", priority: .medium)]
        priorities[.low] = [Todo(title: "Watch TV show", priority: .low)]
    }
    
      
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Priority.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = priorities[Priority.allCases[section]] {
            return list.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Priority.allCases[section] {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! UITodoTableViewCell
        if let todo = priorities[Priority.allCases[indexPath.section]]?[indexPath.row]{
            
            cell.titleLabe.text = todo.title
            cell.checkImage.isHidden = !todo.isDone
        }
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !isEditing,
            let indexPath = tableView.indexPathForSelectedRow,
            let todo = priorities[Priority.allCases[indexPath.section]]?[indexPath.row]
            else {
                return
        }
        todo.isDone = !todo.isDone
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let todo = priorities[Priority.allCases[sourceIndexPath.section]]?.remove(at: sourceIndexPath.row) {
            priorities[Priority.allCases[destinationIndexPath.section]]?.insert(todo, at: destinationIndexPath.row)
            tableView.reloadData()
        }
        
    }
    
    @IBAction func trashButtonTapped(_ sender: Any) {
        if let rows = tableView.indexPathsForSelectedRows {
            let indexSorted = rows.sorted {$0.section == $1.section ? $0.row > $1.row : $0.section > $1.section}
            for index in indexSorted {
                priorities[Priority.allCases[index.section]]?.remove(at: index.row)
                
            }
            tableView.deleteRows(at: rows, with: .automatic)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        deleteButton.isEnabled = editing
        addButton.isEnabled = !editing
        super.setEditing(editing, animated: animated)
    }
    
    @IBAction func unwindToTodoTableView(for segue: UIStoryboardSegue) {
        
        guard segue.identifier == "addUnwindSegue",
            let controller = segue.source as? UIAddTodoTableViewController,
            let titleTodo = controller.titleTF.text
        else {
            return
        }
        
        let newTodo = Todo(title: titleTodo)
        let indexPath = IndexPath(row: priorities[newTodo.priority]!.count, section: newTodo.priority.rawValue)
        priorities[newTodo.priority]?.append(newTodo)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
