//
//  GFEmptyStateView.swift
//  GithubFollower
//
//  Created by Kartikay Pandey on 13/03/23.
//

import UIKit

class GFEmptyStateView: UIView {

    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let imageView =  UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String){
        super.init(frame: .zero)
        messageLabel.text = message
        configureUI()
    }
    
    func configureUI(){
        addSubview(messageLabel)
        addSubview(imageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        imageView.image = UIImage(named: "empty-state-logo-dark")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 120),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 350)
        ])
    }
    
}
