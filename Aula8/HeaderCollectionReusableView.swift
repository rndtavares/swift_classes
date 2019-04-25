//
//  HeaderCollectionReusableView.swift
//  Aula8
//
//  Created by Ronaldo Tavares da Silva on 15/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

protocol HeaderImageDelegate {
    func addImage(_ image: UIImage, toSection section: Int)
}

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var labelHeader: UILabel!
    var parentVC: ViewController?
    var section: Int = 0 {
        didSet {
            labelHeader.text = "Adicionar foto na section \(section)"
        }
    }
    var delegate: HeaderImageDelegate?
    
    
    @IBAction func openCamera(_ sender: UIButton) {
        let picker = UIImagePickerController()
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            
            parentVC?.present(picker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            
            parentVC?.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func openGallery(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        
        parentVC?.present(picker, animated: true, completion: nil)
    }
}

extension HeaderCollectionReusableView: UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UINavigationControllerDelegate{
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parentVC?.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            delegate?.addImage(pickedImage, toSection: section)
            parentVC?.dismiss(animated: true, completion: nil)
        }
    }
}
