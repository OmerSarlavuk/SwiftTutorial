//
//  ViewController.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 11.03.2024.
//

import UIKit
import SnapKit
import Then

class HomePageViewController: UIViewController {
    
    private let stackView = ObjectsFactory.instance.createStackView(aligment: .fill, distribution: .equalSpacing, backgroundColor: .back, spacing: 26, axis: .vertical, cornerRadius: 0, borderWith: 0, borderColor: UIColor.black.cgColor)
    private let middleView = ObjectsFactory.instance.createStackView(aligment: .fill, distribution: .fillEqually, backgroundColor: .back, spacing: 6, axis: .vertical, cornerRadius: 0, borderWith: 0, borderColor: UIColor.black.cgColor)
    private let titleLabel = ObjectsFactory.instance.createLabel(text: "", textAligment: .natural, textColor: .black, font: .systemFont(ofSize: 28))
    private let headerView = { let headerView = HeaderView() ; return headerView }()
    private let tabBarView = { let tabbar = TabBarView() ; return tabbar }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
    }
    
    private func setupUI() {
        view.backgroundColor = .back
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(middleView)
        view.addSubview(tabBarView)
        setupConstraints()
        headerView.backgroundColor = .white
        headerView.layer.cornerRadius = 15
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HeaderViewTapped))
        headerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func HeaderViewTapped() {
        print("Header View tapped")
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.trailing.leading.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(25)
        }
        headerView.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(90)
        }
        middleView.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(360)
        }
        tabBarView.snp.makeConstraints{
            $0.trailing.leading.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    private func configure() {
        headerView.configure(viewModel: HeaderView.headerViewModel(image: UIImage(named: "man")!, title: "Ö.Ş", email: "omersarlavuk6@gmail.com"))
        titleLabel.text = "Profil"
        for (index, item) in HomePageObjcFunctions.instance.contents.enumerated() {
            let partialView = PartialView().then({
                $0.backgroundColor = .white
                $0.layer.cornerRadius = 15
            })
            partialView.configure(viewModel: PartialView.PartialViewModel(imageName: item.0, imageBackGroundColorName: item.1, labelText: item.2, labelTextSize: 14), tag: index)
            middleView.addArrangedSubview(partialView)
        }
    }
}

