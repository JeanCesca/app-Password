//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Jean Ricardo Cesca on 08/08/22.
//

import Foundation
import UIKit

class PasswordCriteriaView: UIView {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let checkmarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")!.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        label.text = text
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 40)
    }

}

extension PasswordCriteriaView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.contentMode = .scaleAspectFit
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
}
