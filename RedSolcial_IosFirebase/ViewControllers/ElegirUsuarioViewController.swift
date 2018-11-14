//
//  ElegirUsuarioViewController.swift
//  RedSolcial_IosFirebase
//
//  Created by Guerra Jose on 7/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class ElegirUsuarioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    var usuarios:[Usuario]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.delegate=self
        FIRDatabase.database().reference().child("usuario").observe(FIRDataEventType.childAdded, with: {(snapshot)in
            print(snapshot)
        })

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text=usuario.email
        return cell
    }

    

}
