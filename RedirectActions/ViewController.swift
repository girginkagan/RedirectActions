//
//  ViewController.swift
//  RedirectActions
//
//  Created by Kagan Girgin on 5/25/20.
//  Copyright © 2020 futureworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        
        btnPlayPause.addTarget(self, action: #selector(btnPlayPauseTapped), for: .touchUpInside)
    }
    
    @objc func btnPlayPauseTapped(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension UITableView{
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if point.y < 0{
            return false
        }
        return true
    }
    
}

