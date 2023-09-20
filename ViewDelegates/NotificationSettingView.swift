//
//  NotificationSettingView.swift
//  ViewDelegates
//
//  Created by Alexey Manankov on 20.09.2023.
//

import UIKit

protocol NotificationSettingViewDelegate: AnyObject {
    func didTapEnableButton()
}

class NotificationSettingView: UIView {
    
    weak var delegate: NotificationSettingViewDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "To stay up-to-date enable Push Notifications!"
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Enable Notofocations", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .highlighted)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = bounds.size.width / 2
        imageView.frame = CGRect(x: (bounds.size.width - imageSize) / 2, y: 30, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 10, y: imageSize + 50, width: frame.size.width - 20, height: 100)
        
        button.frame = CGRect(x: 40, y: imageSize + 170, width: frame.size.width - 80, height: 50)
    }
    
    @objc
    private func didTapButton() {
        delegate?.didTapEnableButton()
    }
}
