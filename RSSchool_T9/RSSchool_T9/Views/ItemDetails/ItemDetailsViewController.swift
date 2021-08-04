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
	
	lazy private var separator:UIView = {
		let separator = UIView();
		separator.layer.borderWidth = 1;
		separator.layer.borderColor = UIColor.white.cgColor;
		
		separator.translatesAutoresizingMaskIntoConstraints = false;
		return separator;
	}()
	
	lazy private var detailsContainer:UIStackView = {
		let container = UIStackView();
		container.axis = .vertical;
		
		container.translatesAutoresizingMaskIntoConstraints = false;
		return container;
	}()
	
	lazy private var drawScrollViewContainer:UIScrollView = {
		let drawContainer = UIScrollView();
		
		drawContainer.translatesAutoresizingMaskIntoConstraints = false;
		return drawContainer;
	}()
	
	lazy private var storyDetailsLabel:UILabel = {
		let storyDetailsLabel = PaddingLabel();
		
		storyDetailsLabel.layer.borderWidth = 1;
		storyDetailsLabel.layer.borderColor = UIColor.white.cgColor;
		storyDetailsLabel.layer.cornerRadius = 8;
		storyDetailsLabel.font = UIFont(name: "Rockwell-Regular", size: 24);
		storyDetailsLabel.textColor = .white;
		storyDetailsLabel.paddingTop = 30;
		storyDetailsLabel.paddingLeft = 30;
		storyDetailsLabel.paddingRight = 30;
		storyDetailsLabel.paddingBottom = 30;
		storyDetailsLabel.numberOfLines = 0;
		storyDetailsLabel.lineBreakMode = .byWordWrapping;
		
		storyDetailsLabel.translatesAutoresizingMaskIntoConstraints = false;
		return storyDetailsLabel;
	}()
	
	private let content: ContentType;
	private let drawStories: Bool;
	private let strokeColor: UIColor;
	
	init(withContent content:ContentType, drawStories: Bool, strokeColor: UIColor) {
		self.content = content;
		self.drawStories = drawStories;
		self.strokeColor = strokeColor;
		
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
		let contentData = ContentData.getData(byContent: content);
		
		self.setupScrollView();
		self.setupCloseButton();
		self.setupCoverImage(withData: contentData);
		self.setupSeparator();
		self.setupDetailsView(withData: contentData);
	}
	
	private func setupScrollView() {
		self.view.addSubview(self.scrollView)
		
		NSLayoutConstraint.activate([
			self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
		]);
	}
	
	private func setupCoverImage(withData data:ContentData) {
		let coverImageContainer = UIView();
		let coverImage = CoverImageView(image: data.coverImage);
		coverImage.layer.cornerRadius = 8;
		coverImage.layer.borderColor = UIColor.white.cgColor;
		coverImage.titleLabel.text = data.title.trimmingCharacters(in: .whitespacesAndNewlines);
		coverImage.titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48);
		coverImage.titleLabel.numberOfLines = 2;
		
		self.itemTypeLabel.text = data.type.rawValue;
		
		coverImageContainer.addSubview(coverImage);
		coverImageContainer.addSubview(self.itemTypeLabel);

		self.scrollView.addSubview(coverImageContainer);
		
		coverImageContainer.translatesAutoresizingMaskIntoConstraints = false;
		coverImage.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			coverImageContainer.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: 30),
			coverImageContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			coverImageContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			coverImageContainer.heightAnchor.constraint(equalTo: coverImage.heightAnchor),
			// Title Label Constraints
			coverImage.titleLabel.leadingAnchor.constraint(equalTo: coverImage.leadingAnchor, constant: 30),
			coverImage.titleLabel.bottomAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: -55),
			// Cover Image Constraints
			coverImage.leadingAnchor.constraint(equalTo: coverImageContainer.leadingAnchor, constant: 20),
			coverImage.trailingAnchor.constraint(equalTo: coverImageContainer.trailingAnchor, constant: -20),
			coverImage.heightAnchor.constraint(equalTo: coverImage.widthAnchor, multiplier: 500.0/374.0),
			// Item Type Label Constraints
			self.itemTypeLabel.heightAnchor.constraint(equalToConstant: 40),
			self.itemTypeLabel.centerXAnchor.constraint(equalTo: coverImageContainer.centerXAnchor),
			self.itemTypeLabel.bottomAnchor.constraint(equalTo: coverImageContainer.bottomAnchor, constant: 20),
		]);
	}
	
	private func setupCloseButton() {
		self.scrollView.addSubview(self.closeButton);
		
		self.closeButton.addTarget(self, action: #selector(closeButtonHandler), for: .touchUpInside);
		
		NSLayoutConstraint.activate([
			self.closeButton.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 30),
			self.closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			self.closeButton.widthAnchor.constraint(equalToConstant: 40),
			self.closeButton.heightAnchor.constraint(equalToConstant: 40)
		]);
	}
	
	private func setupSeparator() {
		self.scrollView.addSubview(self.separator);

		NSLayoutConstraint.activate([
			self.separator.topAnchor.constraint(equalTo: self.itemTypeLabel.bottomAnchor, constant: 40),
			self.separator.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
			self.separator.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
			self.separator.heightAnchor.constraint(equalToConstant: 1),
		]);
	}
	
	private func setupDetailsView(withData data:ContentData) {
		self.scrollView.addSubview(self.detailsContainer);
		
		switch data.type {
			case .Story:
				self.setupStoryDetails(withData: data);
			case .Gallery:
				self.setupGalleryDetails(withData: data);
		}

		NSLayoutConstraint.activate([
			detailsContainer.topAnchor.constraint(equalTo: self.separator.bottomAnchor, constant: 40),
			detailsContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			detailsContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			detailsContainer.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -30),
		]);
	}
	
	private func setupStoryDetails(withData data:ContentData) {
		self.storyDetailsLabel.text = data.text?.trimmingCharacters(in: .whitespacesAndNewlines);
		self.detailsContainer.spacing = 40;
		
		if let paths = data.paths {
			let pathsContainer = UIStackView()
			pathsContainer.spacing = 110;
			pathsContainer.distribution = .equalCentering;
			pathsContainer.isLayoutMarginsRelativeArrangement = true;
			pathsContainer.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 20);
			
			paths.forEach { path in
				let canvas = Canvas(withPath: path, color: self.strokeColor, andDrawTime: self.drawStories ? CGFloat(3) : 0);
				
				pathsContainer.addArrangedSubview(canvas);
			}
			
			self.drawScrollViewContainer.addSubview(pathsContainer);
			pathsContainer.translatesAutoresizingMaskIntoConstraints = false;
			
			let widthConstraint = pathsContainer.widthAnchor.constraint(equalTo: self.drawScrollViewContainer.widthAnchor);
			widthConstraint.priority = .defaultLow;
			
			NSLayoutConstraint.activate([
				pathsContainer.leadingAnchor.constraint(equalTo: self.drawScrollViewContainer.leadingAnchor),
				pathsContainer.trailingAnchor.constraint(equalTo: self.drawScrollViewContainer.trailingAnchor),
				widthConstraint,
			]);
		}
		
		
		self.detailsContainer.addArrangedSubview(self.drawScrollViewContainer);
		self.detailsContainer.addArrangedSubview(self.storyDetailsLabel);
		
		NSLayoutConstraint.activate([
			self.drawScrollViewContainer.heightAnchor.constraint(equalToConstant: 100),
		]);
	}
	
	private func setupGalleryDetails(withData data:ContentData) {
		self.detailsContainer.spacing = 20;
		
		data.images?.forEach({ image in
			let clickableImageView = ClickableImage(withImage: image);
			
			self.detailsContainer.addArrangedSubview(clickableImageView);
			
			clickableImageView.addTarget(self, action: #selector(handleGalleryImageTap(sender:)), for: .touchUpInside);
			
			clickableImageView.translatesAutoresizingMaskIntoConstraints = false;
			clickableImageView.heightAnchor.constraint(equalTo: clickableImageView.widthAnchor, multiplier: 491.0/354.0).isActive = true;
		})
	}
	
	override func viewDidLayoutSubviews() {
		self.closeButton.layer.cornerRadius = self.closeButton.bounds.width / 2;
	}
	
	@objc private func closeButtonHandler() {
		self.dismiss(animated: true, completion: nil);
	}
	
	@objc private func handleGalleryImageTap(sender: ClickableImage) {
		let fullImageVC = FullImageViewController(withImage: sender.image);
		fullImageVC.modalPresentationStyle = .fullScreen;
		
		self.present(fullImageVC, animated: true, completion: nil);
	}
}
