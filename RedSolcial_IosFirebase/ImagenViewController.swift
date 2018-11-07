//
//  ImagenViewController.swift
//  RedSolcial_IosFirebase
//
//  Created by Guerra Jose on 7/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import FirebaseStorage


class ImagenViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var elegirContactoBoton: UIButton!
    
    var imagenPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenPicker.delegate=self

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image=image
        imageView.backgroundColor=UIColor.clear
        imagenPicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func elegirContactoTapped(_ sender: Any) {
        elegirContactoBoton.isEnabled=false
        let imagenesFolder = Storage.storage().reference().child("imagenes")
        let imagenData = UIImagePNGRepresentation(imageView.image!, 0.1)!
        
        imagenesFolder.child("\(NSUUID().uuidString).jpg").putData(imagenData, metadata: nil, completion:{(metadata,error)in
            print("Intentando Subir Imagen")
            if error != nil{
                print("Ocurrio un error:\(error)")
            }else{
                self.performSegue(withIdentifier: "seleccionarContactoSegue", sender: nil)
            }
        })
    }
    @IBAction func camaraTapped(_ sender: Any) {
        imagenPicker.sourceType = .savedPhotosAlbum
        imagenPicker.allowsEditing=false
        present(imagenPicker,animated: true,completion: nil)
    }
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    


}
