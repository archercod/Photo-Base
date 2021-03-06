//
//  AddViewController.swift
//  Photo Base
//
//  Created by Marcin Pietrzak on 20.07.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var item: Entity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if item != nil {
            titleTextField.text = item?.titletext
            descriptionTextField.text = item?.descriptiontext
            imageView.image = UIImage(data: (item?.image)! as Data)
            self.navigationItem.title = item?.titletext
        } else {
            self.navigationItem.title = "Add New Data"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    @IBAction func camera(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        pickerController.allowsEditing = true
        self.present(pickerController, animated: true, completion: nil)
    }

    @IBAction func save(_ sender: Any) {
        
        if item != nil {
            item?.titletext = titleTextField.text
            item?.descriptiontext = descriptionTextField.text
            item?.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        } else {
            let entityDescription = NSEntityDescription.entity(forEntityName: "Entity", in: pc)
            let item = Entity(entity: entityDescription!, insertInto: pc)
            item.titletext = titleTextField.text
            item.descriptiontext = descriptionTextField.text
            item.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        }
        
        do {
            try pc.save()
        }
        catch {
            print(error)
            return
        }
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func library(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerController.allowsEditing = true
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
