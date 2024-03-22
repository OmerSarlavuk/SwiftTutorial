//
//  PartialView.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 21.03.2024.
//

import UIKit
import SnapKit
import Then

class PartialView :  UIView {
    
    class PartialViewModel {
        let imageName : String
        let imageBackGroundColorName : String
        let labelText : String
        let labelTextSize : CGFloat
        
        init(imageName: String, imageBackGroundColorName: String, labelText: String, labelTextSize: CGFloat) {
            self.imageName = imageName
            self.imageBackGroundColorName = imageBackGroundColorName
            self.labelText = labelText
            self.labelTextSize = labelTextSize
        }
    }
    
    var partialViewModel : PartialViewModel?
    
    private let image = ObjectsFactory.instance.createImageView(image: UIImage(named: "right")!, contentMode: .scaleAspectFit, cornerRadius: 5, backgroundColor: .white)
    private let button = ObjectsFactory.instance.createImageView(image: UIImage(named: "right")!, contentMode: .scaleAspectFit, cornerRadius: 0, backgroundColor: .white)
    private let label = { let label = UILabel() ; return label }()
    private lazy var tapGesture = ObjectsFactory.instance.createGesture(target: self, action: #selector(partialViewTapped))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(image)
        addSubview(label)
        addSubview(button)
        addGestureRecognizer(tapGesture)
        setupConstraints()
    }
    
    private func setupConstraints() {
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
            $0.width.height.equalTo(25)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            }
    }
    
    func configure(viewModel : PartialViewModel, tag: Int) {
        self.partialViewModel = viewModel
        self.tag = tag
        image.image = UIImage(named: viewModel.imageName)
        image.backgroundColor = UIColor(named: viewModel.imageBackGroundColorName)
        label.text = viewModel.labelText
        label.font = .systemFont(ofSize: viewModel.labelTextSize)
        button.image = UIImage(named: "right")
    }
    
    @objc private func partialViewTapped() {
        let value = HomePageObjcFunctions.instance.MiddleViewButtonTapped(tag: tag)
        print("Partial View tapped, tag: \(value)")
    }
}

