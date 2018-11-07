//
//  ViewController.swift
//  RedSolcial_IosFirebase
//
//  Created by Guerra Jose on 24/10/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user,error) in
            print("Intentamos Iniciar Sesion")
            if(error != nil){
                print("Tenemos el siguiente Error: \(error!)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user,error)in
                    print("Intetamos crear un usuario")
                    if error != nil{
                        print("Tenemos el siguiente Error:\(error!)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
                
            }else{
                print("Inicio de sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

