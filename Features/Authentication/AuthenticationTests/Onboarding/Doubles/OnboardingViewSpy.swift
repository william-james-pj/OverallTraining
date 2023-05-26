//
//  OnboardingViewSpy.swift
//  AuthenticationTests
//
//  Created by Pinto Junior, William James on 26/05/23.
//

import UIKit
@testable import Authentication

final class OnboardingViewSpy: UIView, OnboardingViewProtocol {
    var loginButtonPressed: (() -> Void)?
    
    var registerButtonPressed: (() -> Void)?    
}
