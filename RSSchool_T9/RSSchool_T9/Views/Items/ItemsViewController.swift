//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 7/30/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsViewController: UIViewController {
	private let itemsInRow = 2;
	
	weak var settingsVC:SettingsViewController!;
	
	init(withSettingsVC settingsVC: SettingsViewController) {
		self.settingsVC = settingsVC;
		
		super.init(nibName: nil, bundle: nil);
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
		super.viewDidLoad();

        // Do any additional setup after loading the view.
		self.view.backgroundColor = .white;
		
		self.setupTabBar();
		self.setupNavigationBar();
		self.setupLayout();
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated);
		
		
	}
	
	private func setupTabBar() {
		self.tabBarItem = UITabBarItem(title: "Items",
										image: UIImage(systemName: "square.grid.2x2"),
										selectedImage: nil);
	}
	
	private func setupNavigationBar() {
		self.navigationController?.isNavigationBarHidden = true;
	}
	
	private func setupLayout() {
		let scrollView = UIScrollView();
		let viewContainer = UIStackView();
		viewContainer.axis = .vertical;
		viewContainer.spacing = 30;
		
		let rowCount = (Float(FillingData.data.count) / Float(self.itemsInRow)).rounded(.up);
		
		for rowIdx in 0..<Int(rowCount) {
			let row = UIStackView();
			row.spacing = 16;
			
			for idxInRow in 0..<self.itemsInRow where rowIdx * self.itemsInRow + idxInRow < FillingData.data.count {
				let idx = rowIdx * self.itemsInRow + idxInRow;
				let tileView = ItemTile(withContent: FillingData.data[idx]);
				row.addArrangedSubview(tileView);

				tileView.translatesAutoresizingMaskIntoConstraints = false;
				NSLayoutConstraint.activate([
					tileView.heightAnchor.constraint(equalTo: tileView.widthAnchor, multiplier: 220.0/179.0),
				]);
				tileView.addTarget(self, action: #selector(tileHandler(_:)), for: .touchUpInside);
			}
			
			viewContainer.addArrangedSubview(row);
		}
		
		scrollView.addSubview(viewContainer);
		self.view.addSubview(scrollView);
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false;
		viewContainer.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			// Scroll View
			scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			// View Container
			viewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
			viewContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			viewContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			viewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
		]);
	}
	
	@objc private func tileHandler(_ sender:ItemTile) {
		let itemDetailVC = ItemDetailsViewController(withContent: sender.content,
													 drawStories: self.settingsVC.drawStories,
													 strokeColor: UIColor(fromHexFormat: self.settingsVC.strokeColor as String));
		itemDetailVC.modalPresentationStyle = .fullScreen;
		
		self.navigationController?.present(itemDetailVC, animated: true, completion: nil);
	}
}

