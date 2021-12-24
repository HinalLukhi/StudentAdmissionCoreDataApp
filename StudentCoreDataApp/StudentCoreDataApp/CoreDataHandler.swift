//
//  CoreDataHandler.swift
//  MyCoreDataApp
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext: NSManagedObjectContext?
    
    private init(){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save () {
        appDelegate.saveContext()
    }
    
    func insert(id: Int,name: String,pwd: String,email:String,sclass:String,completion: @escaping () -> Void){
        let stud = Students(context: managedObjectContext!)
        stud.name = name
        stud.id = Int64(id)
        stud.email = email
        stud.pwd = pwd
        stud.sclass = sclass
        save()
        completion()
    }
    
    func update(stud:Students, name: String,email:String,sclass:String,completion: @escaping () -> Void) {
        stud.name = name
        stud.email = email
        stud.sclass = sclass
        save()
        completion()
    }
    func delete(stud:Students,completion: @escaping () -> Void){
        managedObjectContext!.delete(stud)
        
        save()
        completion()
    }
    
    func fetch() -> [Students] {
        
        let fetchRequset:NSFetchRequest<Students> = Students.fetchRequest()
        
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequset)
            return studArray!
        } catch {
            print(error)
            return [Students]()
        }
    }
    
    func fetchClassWise(sclass:String) -> [Students] {
        
        let fetchRequset:NSFetchRequest<Students> = Students.fetchRequest()
        let predict = NSPredicate(format: "sclass contains %@",sclass)
        fetchRequset.predicate = predict
        
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequset)
            return studArray!
        } catch {
            print(error)
            return [Students]()
        }
    }
    
    func insertNotice(title:String,date:String,discription:String,completion: @escaping () -> Void){
        let n1 = Notice(context: managedObjectContext!)
        n1.title = title
        n1.date = date
        n1.discription = discription
        save()
        completion()
    }
    
    func updateNotice(n1:Notice,title:String,date:String,discription:String,completion: @escaping () -> Void) {
       n1.title = title
        n1.date = date
        n1.discription = discription
        save()
        completion()
    }
    
    func deleteNotice(n1:Notice,completion: @escaping () -> Void){
        managedObjectContext!.delete(n1)
        
        save()
        completion()
    }
    func fetchNotice() -> [Notice] {
        
        let fetchRequset:NSFetchRequest<Notice> = Notice.fetchRequest()
        
        do{
            let noticeArray = try managedObjectContext?.fetch(fetchRequset)
            return noticeArray!
        } catch {
            print(error)
            return [Notice]()
        }
    }
    func chkLogin(uid:Int) -> Students {
        
        let fetchRequset:NSFetchRequest<Students> = Students.fetchRequest()
        let predict = NSPredicate(format: "id contains %i",uid)
        fetchRequset.predicate = predict
        
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequset)
           // print(studArray![0].name!)
            return studArray![0]
        } catch {
            print(error)
            return Students()
        }
    }
    func updatePwd(stud:Students, pwd: String,completion: @escaping ((Bool) -> Void)){
        stud.pwd = pwd
        save()
        completion(true)
    }
}
