//
//  TabBarView.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 11.03.2024.
//

import UIKit
import SnapKit
import Then

class TabBarView : UIView {
    
    private let stackView = ObjectsFactory.instance.createStackView(aligment: .center, distribution: .fillEqually, backgroundColor: .white, spacing: 0, axis: .horizontal, cornerRadius: 20, borderWith: 1, borderColor: UIColor.black.cgColor)//Bu stack tabbardaki nesneleri yan yana sıralayacak
    
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
        createTabBarView()
        stackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackView.layer.masksToBounds = false
    }
       
    private func setupConstraints() {
        stackView.snp.makeConstraints{
            $0.trailing.leading.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    private func createTabBarView() {
        for content in HomePageObjcFunctions.instance.contentss {
            let vertStack = createStackView()
            let button = self.createButton(buttonImageName: content.0, tag: content.2)
            let label = ObjectsFactory.instance.createLabel(text: content.1, textAligment: .center, textColor: .black, font: .systemFont(ofSize: 12))
            stackView.addArrangedSubview(vertStack)
            vertStack.addArrangedSubview(button)
            vertStack.addArrangedSubview(label)
        }
    }
    
    private func createStackView() -> UIStackView { //Bu stackview button ve label alt alta eklemek için üretilmekte
        let stackView = UIStackView().then({
            $0.axis = .vertical
            $0.spacing = 3
            $0.distribution = .fill
        })
        return stackView
    }
    
    private func createButton(buttonImageName: String, tag: Int) -> UIButton {
        let button = UIButton().then({
            $0.setImage(UIImage(named: buttonImageName), for: .normal)
            $0.tag = tag
            $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        })
        return button
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let result = HomePageObjcFunctions.instance.TabBarTapped(tag: sender.tag)
        print("tapped -> \(result)")
    }
}

