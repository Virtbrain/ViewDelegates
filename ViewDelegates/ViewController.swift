//
//  ViewController.swift
//  ViewDelegates
//
//  Created by Alexey Manankov on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let notificationsView = NotificationSettingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(notificationsView)
        notificationsView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        notificationsView.frame = CGRect(
            x: 10,
            y: view.safeAreaInsets.top,
            width: view.frame.size.width - 20,
            height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        )
    }
}

extension ViewController: NotificationSettingViewDelegate {
    func didTapEnableButton() {
        let alert = UIAlertController(
            title: "Enable Notifications",
            message: "Some longer message here to tell user to do stuff",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
}
