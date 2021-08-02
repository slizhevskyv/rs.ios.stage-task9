//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemDetailsViewController: UIViewController {
	lazy private var scrollView:UIScrollView = {
		let scrollView = UIScrollView();

		scrollView.translatesAutoresizingMaskIntoConstraints = false;
		return scrollView;
	}()
	
	lazy private var closeButton:UIButton = {
		let closeButton = UIButton();
		closeButton.layer.borderWidth = 1;
		closeButton.layer.borderColor = UIColor.white.cgColor;
		
		let xMark = UIImage(systemName: "xmark");
		closeButton.setImage(xMark, for: .normal);
		closeButton.tintColor = .white;
		
		closeButton.translatesAutoresizingMaskIntoConstraints = false;
		return closeButton;
	}()
	
	lazy private var itemTypeLabel:UILabel = {
		let label = PaddingLabel();
		label.font = UIFont(name: "Rockwell-Regular", size: 24);
		label.textColor = .white;
		label.backgroundColor = .black;
		label.layer.borderWidth = 1;
		label.layer.borderColor = UIColor.white.cgColor;
		label.layer.cornerRadius = 8;
		label.paddingTop = 11;
		label.paddingLeft = 30;
		label.paddingRight = 30;
		label.paddingBottom = 5;
		label.clipsToBounds = true;
		
		label.translatesAutoresizingMaskIntoConstraints = false;
		return label;
	}()
	
	private let content: ContentType;
	
	init(withContent content:ContentType) {
		self.content = content;
		
		super.init(nibName: nil, bundle: nil)
		
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .black;
    }
	
	private func setupLayout() {
		let contentData = Constants.getContentData(byContent: self.content);
		
		self.view.addSubview(self.scrollView)
		
		NSLayoutConstraint.activate([
			self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
		]);

		self.setupCloseButton();
		self.setupCoverImage(withData: contentData);
		
	}
	
	private func setupCoverImage(withData data:Constants.ContentData) {
		let container = UIView();
		let coverImage = CoverImageView(image: data.coverImage);
		coverImage.layer.borderColor = UIColor.white.cgColor;
		coverImage.titleLabel.text = data.title.trimmingCharacters(in: .whitespacesAndNewlines);
		coverImage.titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48);
		coverImage.titleLabel.numberOfLines = 2;
		
		self.itemTypeLabel.text = data.type.rawValue;
		
		container.addSubview(coverImage);
		container.addSubview(self.itemTypeLabel);

		self.scrollView.addSubview(container);
		
		container.translatesAutoresizingMaskIntoConstraints = false;
		coverImage.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: 30),
			container.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			container.heightAnchor.constraint(equalTo: coverImage.heightAnchor),
			container.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -100),
			// Title Label Constraints
			coverImage.titleLabel.leadingAnchor.constraint(equalTo: coverImage.leadingAnchor, constant: 30),
			coverImage.titleLabel.bottomAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: -55),
			// Cover Image Constraints
			coverImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
			coverImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
			coverImage.heightAnchor.constraint(equalTo: coverImage.widthAnchor, multiplier: 500.0/374.0),
			// Item Type Label Constraints
			self.itemTypeLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			self.itemTypeLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
		]);
	}
	
	private func setupCloseButton() {
		self.scrollView.addSubview(self.closeButton);
		
		self.closeButton.addTarget(self, action: #selector(closeButtonHandler), for: .touchUpInside);
		
		NSLayoutConstraint.activate([
			self.closeButton.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 30),
			self.closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
			self.closeButton.widthAnchor.constraint(equalToConstant: 40),
			self.closeButton.heightAnchor.constraint(equalToConstant: 40)
		]);
	}
	
	override func viewDidLayoutSubviews() {
		self.closeButton.layer.cornerRadius = self.closeButton.bounds.width / 2;
		
		let newItemTypeLabelFrame = CGRect(x: self.itemTypeLabel.frame.origin.x,
										   y: self.itemTypeLabel.frame.origin.y + (self.itemTypeLabel.frame.height / 4),
										   width: self.itemTypeLabel.frame.width,
										   height: self.itemTypeLabel.frame.height);
		self.itemTypeLabel.frame = newItemTypeLabelFrame;
	}
	
	@objc private func closeButtonHandler() {
		self.dismiss(animated: true, completion: nil);
	}
}
