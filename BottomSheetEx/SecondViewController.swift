//
//  SecondViewController.swift
//  BottomSheetEx
//
//  Created by mayank ranka on 24/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    var secondLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        view.backgroundColor = .green
        secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "SecondView controller"
        view.addSubview(secondLabel)
        
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
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
