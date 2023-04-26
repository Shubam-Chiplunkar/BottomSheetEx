//
//  BottomSheetView.swift
//  BottomSheetEx
//
//  Created by mayank ranka on 24/04/23.
//

import UIKit
protocol BottomSheetDelegate{
    func crossButton()
    func secondViewButton()
}

class BottomSheetView: UIView {

    var crossButton : UIButton!
    var mainView : UIView!
    var nextButton : UIButton!
    var delegate : BottomSheetDelegate!
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
         loadMainView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadMainView(){
        crossButton = UIButton()
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        crossButton.tintColor = .white
        self.addSubview(crossButton)
        crossButton.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            crossButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            crossButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
        mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.backgroundColor = .white
        self.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 450)
        ])
        
        nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Second View", for: .normal)
        nextButton.backgroundColor = .cyan
        nextButton.setTitleColor(.white, for: .normal)
        mainView.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(secondViewtapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40),
            nextButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40),
        ])
        
    }
    
    @objc func crossButtonTapped(){
        delegate?.crossButton()
    }
    
    @objc func secondViewtapped(){
        delegate?.secondViewButton()
    }
   
}
