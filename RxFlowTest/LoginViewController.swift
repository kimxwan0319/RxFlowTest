//
//  LoginViewController.swift
//  RxFlowTest
//
//  Created by 김수완 on 2021/10/02.
//

import Foundation
import RxSwift
import RxFlow
import RxCocoa
import SnapKit
import Then

class LoginViewController: UIViewController, Stepper {

    let disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
    
    lazy var button = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.rx.tap.subscribe(onNext: {
            self.steps.accept(DefaultStep.homeIsRequired)
        }).disposed(by: self.disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
