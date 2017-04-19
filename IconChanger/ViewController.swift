//
//  ViewController.swift
//  IconChanger
//
//  Created by Adam Bezák on 19.4.17.
//  Copyright © 2017 Adam Bezák. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellId = "cellId"
    let iconArr = ["Aicon", "Bicon", "Cicon"]
    
    func handleChangeButton(name: String) {
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
    
        UIApplication.shared.setAlternateIconName(name){ error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
        self.tableView.register(IconCell.self, forCellReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! IconCell
        cell.iconImageView.image = UIImage(named: iconArr[indexPath.row])
        cell.textLabel?.text = iconArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconArr.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleChangeButton(name: iconArr[indexPath.row])
    }
}

