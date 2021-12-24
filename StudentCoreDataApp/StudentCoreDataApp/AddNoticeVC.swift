//
//  AddNoticeVC.swift
//  Assi11
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddNoticeVC: UIViewController {
    
    
    var n1 : Notice?
    
    public let myTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    public let myTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Date"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 6
        textField.textAlignment = .left
        return textField
    }()
    
    private let contenttextView:UITextView={
        let textview=UITextView()
        textview.text = ""
        textview.textAlignment = .left
        textview.backgroundColor = .white
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.gray.cgColor
        textview.layer.cornerRadius = 6
        return textview
    }()
    
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(OnbtnClick), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Notice"
        view.backgroundColor = .white
        
        //navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        view.addSubview(myTextField1)
        //view.addSubview(myTextField2)
        view.addSubview(myTextField2)
        view.addSubview(contenttextView)
        view.addSubview(MyButton)
        
        if let e1 = n1 {
            myTextField1.text = e1.title
            myTextField2.text = e1.date
            contenttextView.text = e1.discription
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField1.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: view.width - 40, height: 40)
        myTextField2.frame = CGRect(x: 20, y:myTextField1.bottom + 10, width: view.width - 40, height: 40)
        contenttextView.frame = CGRect(x: 20, y: myTextField2.bottom + 10, width: view.width - 40, height: 100)
        MyButton.frame = CGRect(x: 20, y: contenttextView.bottom + 10, width: view.width - 40, height: 40)
    }
    
    @objc func OnbtnClick()
    {
        let name = myTextField1.text!
        let date = myTextField2.text!
        let discription = contenttextView.text!
        
        if let e1 = n1 {
            CoreDataHandler.shared.updateNotice(n1: e1, title: name, date: date, discription: discription) {
                print("Notice UPdated...")
            }
            
        } else{
            CoreDataHandler.shared.insertNotice(title: name, date: date, discription: discription) {
                print("Notice Inserted...")
            }
            
        }
    }
    
    
    
    private func resetFields()
    {
        n1 = nil
        myTextField1.text = ""
        myTextField2.text = ""
        contenttextView.text = ""
        
    }
}
