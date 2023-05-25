//
//  OnboardingView.swift
//  Authentication
//
//  Created by Pinto Junior, William James on 25/05/23.
//

import UIKit

protocol OnboardingViewProtocol where Self: UIView {
}

final class OnboardingView: UIView, OnboardingViewProtocol {
    // MARK: - Constraints
    // MARK: - Variables
    // MARK: - Components
    private let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.accessibilityIdentifier = "stackBase"
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Tests"
        label.textColor = .white
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupView() {
        backgroundColor = UIColor.primaryColor

        buildHierarchy()
        buildConstraints()
    }

    // MARK: - Methods
    private func buildHierarchy() {
        addSubview(stackBase)
    }

    private func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
