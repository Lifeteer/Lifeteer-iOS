//
//  ThirdDetailLandingPageVC.swift
//  Lifeteer-iOS
//
//  Created by 몽이 누나 on 2023/03/09.
//

import UIKit

import SnapKit
import Then

final class ThirdDetailLandingPageVC: UIViewController {
    
    // MARK: - UI Components
    private let titleLabel = UILabel().then {
        $0.text = "음성유언 시뮬레이션"
        $0.textColor = .mainBlack
        $0.font = .h0
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "음성유언, 미리 연습하고 녹음해요.\n필수정보 하나하나 차근히 배워봐요."
        $0.numberOfLines = 2
        let attrString = NSMutableAttributedString(string: $0.text!, attributes: [.font: UIFont.b2, .foregroundColor: UIColor.disabledText])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 7
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    private let landingPageImageView = UIImageView().then {
        $0.image = ImageLiterals.imgLandingPage3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

// MARK: - UI & Layout

extension ThirdDetailLandingPageVC {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(landingPageImageView, subTitleLabel, titleLabel)
        
        landingPageImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(85)
            make.height.equalTo(landingPageImageView.snp.width).multipliedBy(1.8)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(56)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subTitleLabel.snp.top).offset(-13)
            make.centerX.equalToSuperview()
        }
    }
}
