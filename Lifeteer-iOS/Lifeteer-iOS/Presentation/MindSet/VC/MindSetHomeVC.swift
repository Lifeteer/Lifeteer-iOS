//
//  MindSetHomeVC.swift
//  Lifeteer-iOS
//
//  Created by 몽이 누나 on 2023/01/19.
//

import UIKit

import SnapKit
import Then

final class MindSetHomeVC: UIViewController {

    // MARK: - UI Components
    
    private lazy var navibar = CustomNavigationBar(self, type: .menuButtonWithBI)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setLayout()
    }
}

// MARK: - UI & Layout

extension MindSetHomeVC {
    private func setNavigationBar() {
        view.addSubview(navibar)
        
        navibar.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setUI() {
        view.backgroundColor = .mainBackground
    }
    
    private func setLayout() {
        
    }
}