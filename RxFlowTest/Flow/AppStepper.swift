//
//  AppStepper.swift
//  RxFlowTest
//
//  Created by 김수완 on 2021/10/02.
//

import Foundation
import RxSwift
import RxCocoa
import RxFlow

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {}

    var initialStep: Step {
        return DefaultStep.loginIsRequired
    }
}
