//
//  headerView.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 11.03.2024.
//

import UIKit
import SnapKit

class HeaderView : UIView {
    
    class headerViewModel {
        let image: UIImage
        let title: String
        let email: String
        
        init(image: UIImage, title: String, email: String) {
            self.image = image
            self.title = title
            self.email = email
        }
    }
    
    var viewModel : headerViewModel?
    
    private let image = { let image = UIImageView().then({  $0.contentMode = .scaleAspectFit }) ; return image  }()
    private let title = ObjectsFactory.instance.createLabel(text: "", textAligment: .left, textColor: .black, font: .boldSystemFont(ofSize: 24))
    private let email = ObjectsFactory.instance.createLabel(text: "", textAligment: .left, textColor: .black, font: .systemFont(ofSize: 16))
    private let button = { let button = UIImageView().then({ $0.contentMode = .scaleAspectFit }) ; return button }()
    private let stackView1 = ObjectsFactory.instance.createStackView(aligment: .fill, distribution: .fillEqually, backgroundColor: .white, spacing: 0, axis: .vertical, cornerRadius: 0, borderWith: 0, borderColor: UIColor.black.cgColor)

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
        addSubview(stackView1)
        stackView1.addArrangedSubview(title)
        stackView1.addArrangedSubview(email)
        addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(65)
        }
        stackView1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(image.snp.trailing).offset(10)
        }
        button.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(25)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func configure(viewModel : headerViewModel ) {
        self.viewModel = viewModel
        image.image = viewModel.image
        title.text = viewModel.title
        email.text = viewModel.email
        button.image = UIImage(named: "right")
    }
}

