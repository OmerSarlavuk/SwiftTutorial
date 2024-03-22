//
//  ObjectsFactory.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 22.03.2024.
//

import UIKit
import Then

class ObjectsFactory {
    
    static let instance = ObjectsFactory()
    
    func createStackView(aligment: UIStackView.Alignment, distribution: UIStackView.Distribution, backgroundColor: UIColor, spacing: CGFloat, axis: NSLayoutConstraint.Axis, cornerRadius: CGFloat, borderWith: CGFloat, borderColor: CGColor) -> UIStackView {
        let stackView = UIStackView().then({
            $0.alignment = aligment
            $0.distribution = distribution
            $0.backgroundColor = backgroundColor
            $0.spacing = spacing
            $0.axis = axis
            $0.layer.cornerRadius = cornerRadius
            $0.layer.borderWidth = borderWith
            $0.layer.borderColor = borderColor
        })
        return stackView
    }
    
    func createLabel(text: String, textAligment: NSTextAlignment, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel().then({
            $0.text = text
            $0.textAlignment = textAligment
            $0.textColor = textColor
            $0.font = font
        })
        return label
    }
    
    func createImageView(image: UIImage, contentMode: UIImageView.ContentMode, cornerRadius: CGFloat, backgroundColor: UIColor) -> UIImageView {
        let imageView = UIImageView().then({
            $0.image = image
            $0.contentMode = contentMode
            $0.layer.cornerRadius = cornerRadius
            $0.backgroundColor = backgroundColor
        })
        return imageView
    }
    
    func createGesture(target: Any, action: Selector) -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        return gesture
    }
    
}

