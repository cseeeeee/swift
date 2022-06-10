//
//  ViewController.swift
//  date picker
//
//  Created by 203a10 on 2022/03/25.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime = ""
    var currentTime = ""
  


    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime(){
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from:  date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)

//시간을 비교하는 코드입니다. 2022.03.25
        
        if (alarmTime == currentTime){
            view.backgroundColor = UIColor.red
            let alarmonAlert = UIAlertController(title: "알람", message: "알람 시간이 되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            let delayAction = UIAlertAction(title: "미루겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            alarmonAlert.addAction(onAction)
            alarmonAlert.addAction(delayAction)
            present(alarmonAlert,animated: true, completion: nil)
            
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
        
    }
}

