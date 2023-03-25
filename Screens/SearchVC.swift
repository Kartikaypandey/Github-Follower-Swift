//
//  SearchVC.swift
//  GithubFollower
//
//  Created by Kartikay Pandey on 12/02/23.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let followerTextField = GFTextField()
    let getFollowerButton = GHFButton(backgroundColor: .systemGreen, title: "Get Followers !")
    
    var isUserNameEmpty : Bool{
        return followerTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureUI(){
        configureLogoImageView()
        configureTextField()
        configureFollowerButton()
        createDismissTapKeyBoard()
    }
    
    func createDismissTapKeyBoard(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC(){
        guard !isUserNameEmpty else{
            presentGFAlertOnMainThread(title: "No Username", message: "please enter a username , We need to know who to look for 😄", buttonTitle: "Ok")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = followerTextField.text
        followerListVC.title = followerTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func configureTextField(){
        view.addSubview(followerTextField)
        followerTextField.delegate = self
        NSLayoutConstraint.activate([
            followerTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            followerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            followerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            followerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureFollowerButton(){
        view.addSubview(getFollowerButton)
        getFollowerButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowerButton.leadingAnchor.constraint(equalTo: followerTextField.leadingAnchor),
            getFollowerButton.trailingAnchor.constraint(equalTo: followerTextField.trailingAnchor),
            getFollowerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            getFollowerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
extension SearchVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
