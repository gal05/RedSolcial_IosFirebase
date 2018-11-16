//
//  SnapsViewController.swift
//  RedSolcial_IosFirebase
//
//  Created by Guerra Jose on 31/10/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    


    
    
    @IBOutlet weak var tableView1: UITableView!
    
    var snaps :[Snap]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.dataSource=self
        tableView1.delegate=self
    FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot)in
            let snap = Snap()
            snap.imagenURL = (snapshot.value as! NSDictionary)["imagenURL"] as! String
            snap.from = (snapshot.value as! NSDictionary)["from"] as! String
            snap.descrip = (snapshot.value as! NSDictionary)["descripcion"] as! String
            snap.id = snapshot.key
            self.snaps.append(snap)
            self.tableView1.reloadData()
        })
        FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childRemoved, with: {(snapshot) in
            var iterador = 0
            for snap in self.snaps{
                if snap.id == snapshot.key{
                    self.snaps.remove(at: iterador)
                }
                iterador+=1
            }
            self.tableView1.reloadData()
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        cell.textLabel?.text=snap.from
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap=snaps[indexPath.row]
        performSegue(withIdentifier: "versnapsegue", sender: snap)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "versnapsegue"{
            let siguienteVC = segue.destination as! VerSnapViewController
            siguienteVC.snap = sender as! Snap
        }
    }

    /*@IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }*/
    


}
