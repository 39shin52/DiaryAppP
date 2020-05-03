//
//  ViewController.swift
//  DiaryAppP
//
//  Created by Itou Shingo on 2020/04/26.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import UIKit
import JBDatePicker

class ViewController: UIViewController, JBDatePickerViewDelegate {
    
    
    
    @IBOutlet weak var datePickerView: JBDatePickerView!
    @IBOutlet weak var writeButton: UIButton!
    
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePickerView.delegate = self
    }
    
    lazy var dateFormatter:DateFormatter  = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyyMM/dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter
    }()
    
    // 日付選択時
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("day selected:\(dateFormatter.string(from: dayView.date!))")
        date = dateFormatter.string(from: dayView.date!)
    }
    //書き込むボタン選択時
    @IBAction func writeButtonPushed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toDiary", sender: self)
    }
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "toDiary"){
            let diaryView = segue.destination as! DiaryViewController
            diaryView.date = self.date
        }
    }

}

