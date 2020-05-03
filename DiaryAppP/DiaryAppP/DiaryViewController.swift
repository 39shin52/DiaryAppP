//
//  DiaryViewController.swift
//  DiaryAppP
//
//  Created by Itou Shingo on 2020/04/26.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import UIKit
import RealmSwift

class DiaryViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contextView: UITextView!
    
    var date: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contextView.delegate = self
        contextView.layer.borderColor = UIColor.black.cgColor
        contextView.layer.borderWidth = 1.0
        contextView.layer.cornerRadius = 10.0
        contextView.layer.masksToBounds = true
        
        dateLabel.text = date //Labelに日記を表示
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           dateLabel.text = date
           
           DispatchQueue(label: "background").async {
               let realm = try! Realm()
               
               if let savedDiary = realm.objects(Diary.self).filter("date == '\(self.date!)'").last{
                   let context = savedDiary.context
                   DispatchQueue.main.async {
                       self.contextView.text = context
                   }
               }
           }
       }

    @IBAction func saveButton(_ sender: UIButton) {
        let realm = try! Realm() //Realm初期化
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let diary = Diary() //モデルのインスタンス化
        diary.date = date
        diary.context = contextView.text
        
        try! realm.write {
            realm.add(diary, update: .all)
        }
        self.dismiss(animated: true, completion: nil) //前の画面に戻る
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
