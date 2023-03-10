//
//  CustomButton.swift
//  Lifeteer-iOS
//
//  Created by 몽이 누나 on 2023/01/20.
//

import UIKit

@frozen
enum BtnType {
    case fillWithGreen  // 초록 버튼
    case borderWithoutBGC   // 배경 없이 테두리만 있는 버튼
}

public class CustomButton: UIButton {
    
    // MARK: - Initialize
    
    init(title: String, type: BtnType) {
        super.init(frame: .zero)
        self.setUI(title, type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomButton {
    /// 버튼의 enable 여부 설정
    @discardableResult
    public func setEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    /// 버튼의 Title 변경
    @discardableResult
    public func changeTitle(attributedString: NSAttributedString) -> Self {
        self.setAttributedTitle(attributedString, for: .normal)
        return self
    }
    
    /// 버튼의 backgroundColor, textColor 변경
    @discardableResult
    public func setColor(bgColor: UIColor, disableColor: UIColor) -> Self {
        self.setBackgroundColor(bgColor, for: .normal)
        self.setBackgroundColor(disableColor, for: .disabled)
        self.setAttributedTitle(
            NSAttributedString(
                string: self.titleLabel?.text ?? "",
                attributes: [.font: UIFont.h6, .foregroundColor: UIColor.mainGreen]),
            for: .normal)
        
        return self
    }
}

// MARK: - UI & Layout

extension CustomButton {
    private func setUI(_ title: String, _ type: BtnType) {
        self.layer.cornerRadius = 5
        
        switch type {
        case .fillWithGreen:
            self.setBackgroundColor(.mainGreen, for: .normal)
            self.setBackgroundColor(.disabledFill, for: .disabled)
            self.setAttributedTitle(
                NSAttributedString(
                    string: title,
                    attributes: [.font: UIFont.h6, .foregroundColor: UIColor.mainBackground]
                ),
                for: .normal
            )
            self.setAttributedTitle(
                NSAttributedString(
                    string: title,
                    attributes: [.font: UIFont.h6, .foregroundColor: UIColor.disabledText]
                ),
                for: .disabled
            )

        case .borderWithoutBGC:
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.mainGreen.cgColor
            self.setBackgroundColor(.clear, for: .normal)
            self.setAttributedTitle(
                NSAttributedString(
                    string: title,
                    attributes: [.font: UIFont.b3, .foregroundColor: UIColor.mainGreen]
                ),
                for: .normal
            )
        }
    }
}
