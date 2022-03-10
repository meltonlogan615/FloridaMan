//
//  SettingsViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import Foundation

import UIKit

class SettingsViewController: UIViewController {
  
  let settingsStack = UIStackView()
  
  let source = SourceInfo()
  
  let versionLabel = SettingsLabelRow()
  let versionRow = SettingsRow()
  
  let sourceLabel = SettingsLabelRow()
  let sourceRow = SettingsRow()
  
  let linkLabel = SettingsLabelRow()
  let linkRow = SettingsRow()
  
  let contactLabel = SettingsLabelRow()
  let contactRow = SettingsRow()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Settings"
    navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = .systemGray5

    style()
    layout()
  }
}

extension SettingsViewController {
  func style() {
    settingsStack.translatesAutoresizingMaskIntoConstraints = false
    settingsStack.axis = .vertical
    settingsStack.spacing = 8
    
    versionLabel.translatesAutoresizingMaskIntoConstraints = false
    versionLabel.label.text = "Version"
    
    versionRow.translatesAutoresizingMaskIntoConstraints = false
    versionRow.infoLabel.text = "Version: \(source.version) - Released: Today"
    
    sourceLabel.translatesAutoresizingMaskIntoConstraints = false
    sourceLabel.label.text = "Data Source & Inspiration"
    
    sourceRow.translatesAutoresizingMaskIntoConstraints = false
    sourceRow.linkButton.isHidden = false
    sourceRow.linkButton.tag = 0
    sourceRow.linkButton.setTitle("Data Source & Inspiration", for: [])
    sourceRow.linkButton.addTarget(self, action: #selector(linkTapped), for: .primaryActionTriggered)
    sourceRow.infoLabel.isHidden = true
    
    linkLabel.translatesAutoresizingMaskIntoConstraints = false
    linkLabel.label.text = "Methodology"
    
    linkRow.translatesAutoresizingMaskIntoConstraints = false
    linkRow.linkButton.isHidden = false
    linkRow.linkButton.tag = 1
    linkRow.linkButton.setTitle("Medium Article by Kevin McElwee", for: [])
    linkRow.linkButton.addTarget(self, action: #selector(linkTapped), for: .primaryActionTriggered)
    linkRow.infoLabel.isHidden = true

    contactLabel.translatesAutoresizingMaskIntoConstraints = false
    contactLabel.label.text = "Contact the Developer"
    
    contactRow.linkButton.isHidden = false
    contactRow.linkButton.tag = 2
    contactRow.linkButton.setTitle("@StinkyStinkFace", for: [])
    contactRow.linkButton.addTarget(self, action: #selector(linkTapped), for: .primaryActionTriggered)
    contactRow.infoLabel.isHidden = true

    }
  
  func layout() {
    view.addSubview(settingsStack)
    NSLayoutConstraint.activate([
      settingsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: settingsStack.trailingAnchor, multiplier: 2),
      settingsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
    ])
    
    settingsStack.addArrangedSubview(versionLabel)
    settingsStack.addArrangedSubview(versionRow)
    settingsStack.addArrangedSubview(sourceLabel)
    settingsStack.addArrangedSubview(sourceRow)
    settingsStack.addArrangedSubview(linkLabel)
    settingsStack.addArrangedSubview(linkRow)
    settingsStack.addArrangedSubview(contactLabel)
    settingsStack.addArrangedSubview(contactRow)    
  }
}

extension SettingsViewController {
  @objc func linkTapped(sender: UIButton) {
    let linkVC = SettingsLinkViewController()
    let selected = sender.tag
    switch selected {
      case 0:
        linkVC.articleURL = source.sourceURL
      case 1:
        linkVC.articleURL = source.sourceArticleURL
      case 2:
        linkVC.articleURL = source.twitter
      default:
        break
    }
    navigationController?.pushViewController(linkVC, animated: true)
  }
}
