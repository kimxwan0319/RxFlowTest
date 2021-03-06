//
//  AppStepper.swift
//  RxFlowTest
//
//  Created by κΉμμ on 2021/10/02.
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
