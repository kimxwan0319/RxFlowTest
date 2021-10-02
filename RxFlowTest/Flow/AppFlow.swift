//
//  AppFlow.swift
//  RxFlowTest
//
//  Created by 김수완 on 2021/10/02.
//

import Foundation
import RxFlow

class AppFlow: Flow {
    
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DefaultStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return self.navigateToHome()
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: DefaultStep.loginIsRequired)))
    }

    private func navigateToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        Flows.use(homeFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: DefaultStep.homeIsRequired)))
    }
}
