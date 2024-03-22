//
//  MiddleView.swift
//  snpkt_ttr
//
//  Created by Ahlatci on 11.03.2024.
//

import UIKit
import SnapKit

class MiddleView : UIView {
    
    let contents = [
        ("circleup", "orange", "Üretici Yazılımı Güncelleştirmesi", 0),
        ("share", "blue", "Cihaz Paylaşımı", 1),
        ("voice", "green", "Ses Kontrolü", 2),
        ("info", "purple", "Yardım ve Geri Bildirim", 3),
        ("our", "red", "Hakkımızda", 4),
        ("setting", "darkGreens", "Ayarlar", 5)
    ]
    
    private let stackView : UIStackView = {
        let stackView = UIStackView().then({
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 6
            $0.backgroundColor = .back
            $0.axis = .vertical
        })
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
        setupConstraints()
        createStackView()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(-4)
            $0.trailing.equalToSuperview().offset(-16)  
        }
    }
    
    private func createView() -> UIView {
        let view = UIView().then({
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .white
        })
        return view
    }
    
    private func createStackView() {
        for content in self.contents {
            let view = self.createView()
            let image = self.createImage(imageName: content.0, imageBackGroundColor: content.1)
            let label = self.createLabel(text: content.2, fontSize: 16)
            let button = self.createButton(buttonImageName: "right", tag: content.3)
            stackView.addArrangedSubview(view)
            view.addSubview(image)
            view.addSubview(label)
            view.addSubview(button)
            image.snp.makeConstraints{
                $0.height.width.equalTo(35)
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(16)
                }
            label.snp.makeConstraints{
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(image.snp.trailing).offset(12)
                }
            button.snp.makeConstraints{
                $0.width.height.equalTo(35)
                $0.trailing.equalToSuperview().offset(-16)
                $0.centerY.equalToSuperview()
                }
            view.snp.makeConstraints{
                $0.height.equalTo(55)
            }
        }
    }
    
    private func createImage(imageName: String, imageBackGroundColor: String) -> UIImageView{
        let image = UIImageView().then({
            $0.image = UIImage(named: imageName)
            $0.layer.cornerRadius = 5
            $0.backgroundColor = UIColor(named: imageBackGroundColor)
        })
        return image
    }
    
    private func createLabel(text : String, fontSize: Int) -> UILabel {
        let label = UILabel().then({
            $0.text = text
            $0.font = .systemFont(ofSize: CGFloat(fontSize))
        })
        return label
    }
    
    private func createButton(buttonImageName: String, tag: Int) -> UIButton{
        let button = UIButton().then({
            $0.setImage(UIImage(named: buttonImageName), for: .normal)
            $0.tag = tag
            $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        })
        return button
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let result = HomePageObjcFunctions.instance.MiddleViewButtonTapped(tag: sender.tag)
        print("tapped -> \(result)")
    }
    
}

