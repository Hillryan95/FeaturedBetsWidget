//
//  ViewController.swift
//  SBGWidget
//
//  Created by Ryan Hill on 21/02/2022.
//

import UIKit
import WidgetKit

class ViewController: UIViewController {

    var viewModels: [FeaturedBetViewModel]!
    let featuredBetService = FeaturedBetService()

    var getFreeBetButton: UIButton!
    var viewModel: FeaturedBetViewModel?
    var stackView: UIStackView!
    var nameLabel: UILabel!
    var outcomeLabel: UILabel!
    var timeLabel: UILabel!
    var locationLabel: UILabel!
    var priceLabel: UILabel!
    var sportLabel: UILabel!
    var showMockBetslipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .skyBetBlue

        self.viewModels = featuredBetService.allFeaturedBets.map({
            FeaturedBetViewModel(model: $0)
        })
        
        viewModel = viewModels.first

        guard let viewModel = viewModel else {
            return
        }

        setupStackView()
        setupNameLabel()
        setupOutcomeLabel()
        setupTimeLabel()
        setupLocationLabel()
        setupPriceLabel()
        setupSportLabel()
        setupGetFeaturedBetButton()
        setupShowMockBetslipButton()

        configure(with: viewModel)
    }

    func configure(with viewModel: FeaturedBetViewModel) {
        self.viewModel = viewModel

        nameLabel.text = viewModel.name
        outcomeLabel.text = viewModel.outcome
        timeLabel.text = viewModel.time
        locationLabel.text = viewModel.location
        priceLabel.text = viewModel.price
        sportLabel.text = viewModel.sport
    }

    private func setupStackView() {
        stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .skyBetBlue
        stackView.spacing = Constants.spacing
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNameLabel() {
        nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: nameLabel)

        stackView.addArrangedSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50.0),
            nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupOutcomeLabel() {
        outcomeLabel = UILabel(frame: .zero)
        outcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        outcomeLabel.textColor = .white
        outcomeLabel.textAlignment = .left
        outcomeLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: outcomeLabel)

        stackView.addArrangedSubview(outcomeLabel)

        NSLayoutConstraint.activate([
            outcomeLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupTimeLabel() {
        timeLabel = UILabel(frame: .zero)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .white
        timeLabel.textAlignment = .left
        timeLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: timeLabel)

        stackView.addArrangedSubview(timeLabel)

        NSLayoutConstraint.activate([
            timeLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupLocationLabel() {
        locationLabel = UILabel(frame: .zero)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = .white
        locationLabel.textAlignment = .left
        locationLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: locationLabel)

        stackView.addArrangedSubview(locationLabel)

        NSLayoutConstraint.activate([
            locationLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupPriceLabel() {
        priceLabel = UILabel(frame: .zero)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .white
        priceLabel.textAlignment = .left
        priceLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: priceLabel)

        stackView.addArrangedSubview(priceLabel)

        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupSportLabel() {
        sportLabel = UILabel(frame: .zero)
        sportLabel.translatesAutoresizingMaskIntoConstraints = false
        sportLabel.textColor = .white
        sportLabel.textAlignment = .left
        sportLabel.font = Constants.generalFont
        stackView.setCustomSpacing(10.0, after: sportLabel)

        stackView.addArrangedSubview(sportLabel)

        NSLayoutConstraint.activate([
            sportLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupGetFeaturedBetButton() {
        getFreeBetButton = UIButton(frame: .zero)
        getFreeBetButton.translatesAutoresizingMaskIntoConstraints = false
        getFreeBetButton.layer.cornerRadius = Constants.cornerRadius
        getFreeBetButton.backgroundColor = .skyBetBlue
        getFreeBetButton.setContentHuggingPriority(.required, for: .horizontal)
        getFreeBetButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        getFreeBetButton.setTitle("Get Featured Bet", for: .normal)
        getFreeBetButton.tintColor = .skyBetBlue
        getFreeBetButton.addTarget(self, action: #selector(setupButtonTapped(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(getFreeBetButton)

        NSLayoutConstraint.activate([
            getFreeBetButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupShowMockBetslipButton() {
        showMockBetslipButton = UIButton(frame: .zero)
        showMockBetslipButton.translatesAutoresizingMaskIntoConstraints = false
        showMockBetslipButton.layer.cornerRadius = Constants.cornerRadius
        showMockBetslipButton.backgroundColor = .skyBetBlue
        showMockBetslipButton.setContentHuggingPriority(.required, for: .horizontal)
        showMockBetslipButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        showMockBetslipButton.setTitle("Show Mock Betslip", for: .normal)
        showMockBetslipButton.tintColor = .skyBetBlue
        showMockBetslipButton.addTarget(self, action: #selector(showMockBetslipTapped(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(showMockBetslipButton)

        NSLayoutConstraint.activate([
            showMockBetslipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMockBetslipButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            showMockBetslipButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }

    @objc private func setupButtonTapped(_ sender: UIButton) {
        let randomViewModel = viewModels.randomElement()!
        configure(with: randomViewModel)

        let userDefaults = UserDefaults(suiteName: "group.RyanHill.SBGWidget")

        guard let userDefaults = userDefaults else { return }

        let featuredBetArray: [String] = [randomViewModel.name, randomViewModel.price, randomViewModel.outcome, randomViewModel.sport, randomViewModel.location, randomViewModel.time]

        userDefaults.set(featuredBetArray, forKey: "featuredBet")

        WidgetCenter.shared.reloadAllTimelines()
    }

    @objc private func showMockBetslipTapped(_ sender: UIButton) {
        present(MockBetSlipViewController(), animated: true, completion: nil)
    }
}

private extension ViewController {
    enum Constants {
        // Fonts
        static let generalFont = UIFont.systemFont(ofSize: 18.0, weight: .semibold)

        // Spacing and Radius
        static let spacing = 10.0
        static let cornerRadius = 12.0
    }
}


