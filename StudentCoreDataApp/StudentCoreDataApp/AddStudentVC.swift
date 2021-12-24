//
//  AddStudentVC.swift
//  Assi11
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddStudentVC: UIViewController {

    //let sql1 = SqliteHandler.shared
    var stud : Students?
    private var studArray = [Students]()
    
    public let myTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Id"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField3:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField4:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter class"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    //private let ClassPV = UIPickerView()
   // private let pickerData = ["FYMCA","SYMCA","TYMCA"]
    public let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(OnbtnClick), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        view.addSubview(myTextField1)
        view.addSubview(myTextField2)
        view.addSubview(myTextField3)
        view.addSubview(myTextField4)
        view.addSubview(MyButton)
        
        if let s1 = stud {
            myTextField1.text = String(s1.id)
            myTextField2.text = s1.name
            myTextField3.text = s1.email
            myTextField4.text = s1.sclass
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField1.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.width - 40, height: 40)
        myTextField2.frame = CGRect(x: 20, y:myTextField1.bottom + 10, width: view.width - 40, height: 40)
        myTextField3.frame = CGRect(x: 20, y: myTextField2.bottom + 10, width: view.width - 40, height: 40)
         myTextField4.frame = CGRect(x: 20, y: myTextField3.bottom + 10, width: view.width - 40, height: 40)
        MyButton.frame = CGRect(x: 20, y: myTextField4.bottom + 10, width: view.width - 40, height: 40)
    }
    
    @objc func OnbtnClick()
    {
        let id = myTextField1.text!
        let name = myTextField2.text!
        let email = myTextField3.text!
        let sclass = myTextField4.text!
        
       if let s1 = stud {
        CoreDataHandler.shared.update(stud: s1, name: name, email: email, sclass: sclass) {
            print("Data Updated...")
            self.resetFields()
        }
        
        } else{
        CoreDataHandler.shared.insert(id: Int(id)!, name: name, pwd: "12345", email: email, sclass: sclass) {
            print("Data inserted...")
            self.resetFields()
        }
        }
    }
    
   
    
    private func resetFields()
    {
        stud = nil
        myTextField1.text = ""
        myTextField2.text = ""
        myTextField3.text = ""
        myTextField4.text = ""
        
    }

}
