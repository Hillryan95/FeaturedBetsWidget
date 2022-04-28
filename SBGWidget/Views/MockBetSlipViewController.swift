//
//  MockBetSlipViewController.swift
//  SBGWidget
//
//  Created by Ryan Hill on 31/03/2022.
//

import UIKit

class MockBetSlipViewController: UIViewController {

    var price: String?

    public let betAddedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    public let returnHomeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.spacing
        button.backgroundColor = .systemGreen
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(returnHomeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .skyBetBlue
        configure()
        addSubviews()
        setupConstraints()
    }

    private func configure() {
        let price = price ?? ""
        betAddedLabel.text = "Bet Added to Bet Slip \(price)"
        returnHomeButton.setTitle("Return Home", for: .normal)
    }

    private func addSubviews() {
        view.addSubview(betAddedLabel)
        view.addSubview(returnHomeButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            betAddedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            betAddedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            returnHomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            returnHomeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20.0),
            returnHomeButton.topAnchor.constraint(equalTo: betAddedLabel.bottomAnchor, constant: 20.0)
        ])
    }

    @objc private func returnHomeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension MockBetSlipViewController {
    enum Constants {
        static let spacing = 10.0
    }
}
