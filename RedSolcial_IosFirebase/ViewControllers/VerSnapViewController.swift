//
//  VerSnapViewController.swift
//  RedSolcial_IosFirebase
//
//  Created by Guerra Jose on 14/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class VerSnapViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBOutlet weak var Label: UILabel!
    
    var snap=Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text? = snap.descrip
        ImageView.sd_setImage(with: URL(string:snap.imagenURL))
    }
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.id).removeValue()
        FIRStorage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete{(error) in
            print("se elimino la imagen correctamente")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    


}
