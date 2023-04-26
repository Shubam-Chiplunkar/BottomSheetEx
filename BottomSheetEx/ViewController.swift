//
//  ViewController.swift
//  BottomSheetEx
//
//  Created by mayank ranka on 24/04/23.
//

import UIKit
import MapKit
class ViewController: UIViewController , BottomSheetDelegate{
    
    
    var label : UILabel!
    var but   : UIButton!
    var bottomSheet : BottomSheetView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First View Controller"
        label.textColor = .black
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("Bottom Sheet", for: .normal)
        but.backgroundColor = .white
        but.setTitleColor(UIColor.cyan, for: .normal)
        view.addSubview(but)
        but.addTarget(self, action: #selector(loadBottomSheet), for: .touchUpInside)
        NSLayoutConstraint.activate([
            but.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            but.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            but.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
  
    
    @objc func loadBottomSheet(){
        bottomSheet = BottomSheetView()
        bottomSheet.translatesAutoresizingMaskIntoConstraints = false
        bottomSheet.delegate = self
        view.addSubview(bottomSheet)
        bottomSheet.transform = CGAffineTransform(translationX: 0, y: 500)
        NSLayoutConstraint.activate([
            bottomSheet.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomSheet.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        UIView.animate(withDuration: 0.3) { [self] in
            bottomSheet.transform = CGAffineTransform.identity
        }
    }

    

    func crossButton() {
        if bottomSheet != nil{
            bottomSheet.removeFromSuperview()
            bottomSheet = nil
        }
        
    }
    
    func secondViewButton() {
        if bottomSheet != nil{
            bottomSheet.removeFromSuperview()
            bottomSheet = nil
        }
//        let vc = SecondViewController()
//        print(navigationController?.pushViewController(vc, animated: true))
        let vc : SecondViewController? = SecondViewController()
        vc?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
//        present(navController, animated: true, completion: nil)
       
    }

}

