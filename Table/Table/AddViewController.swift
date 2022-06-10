//
//  AddViewController.swift
//  Table
//
//  Created by 203a10 on 2022/05/13.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAdditem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdditem(_ sender: UIButton) {
        items.append(tfAdditem.text!)
        itemsImageFile.append("clock.png")
        tfAdditem.text=""
        _ = navigationController?.popViewController(animated: true)
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
