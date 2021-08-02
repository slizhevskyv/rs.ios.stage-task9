//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

private enum ContentViewType:String {
	case Story
	case Gallery
}

private typealias ContentData = (title: String, type: ContentViewType, coverImage: UIImage);

class ItemPreviewTile: UIControl {
	
	private var gradientLayer: CAGradientLayer = {
		let gradient = CAGradientLayer();
		
		gradient.colors = [
			UIColor(named: "GradientStartColor")!.cgColor,
			UIColor(named: "GradientEndColor")!.cgColor,
		];
		
		gradient.locations = [0.75, 1];
		
		return gradient;
	}();
	private var imageView: UIImageView!;

	private(set) var content: ContentType;
	
	init(withContent content: ContentType) {
		self.content = content;
		
		super.init(frame: .zero);
		
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupLayout() {
		self.clipsToBounds = true;
		self.layer.cornerRadius = 18;
		self.layer.borderWidth = 1;
		
		self.setupImageView();
		self.setupDescription();
	}
	
	private func setupImageView() {
		let contentData = getContentData();
		self.imageView = UIImageView.init(image: contentData.coverImage);
		self.imageView.layer.cornerRadius = 10;
		self.imageView.layer.borderWidth = 1;
		self.imageView.clipsToBounds = true;
		self.imageView.contentMode = .scaleAspectFill;
		
		imageView.layer.insertSublayer(self.gradientLayer, at: 0);
		
		self.addSubview(imageView);
		
		imageView.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
		]);
	}
	
	private func setupDescription() {
		let contentData = getContentData();
		
		let titleLabel = UILabel();
		titleLabel.font = UIFont(name: "Rockwell-Regular", size: 16)
		titleLabel.text = contentData.title;
		titleLabel.textColor = .white;
		
		let subtitleLabel = UILabel();
		subtitleLabel.font = UIFont(name: "Rockwell-Regular", size: 12);
		subtitleLabel.text = contentData.type.rawValue;
		subtitleLabel.textColor = UIColor(named: "PreviewTileSubtitleColor")
		
		self.imageView.addSubview(titleLabel);
		self.imageView.addSubview(subtitleLabel);
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false;
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 19),
			titleLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -15),
			titleLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: -30),
			subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 14),
			subtitleLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10),
			subtitleLabel.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -15),
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
		]);
	}
	
	private func getContentData() -> ContentData {
		var coverImage = UIImage();
		var title: String = "";
		var type: ContentViewType = .Story;
		
		if case .story(let story) = content {
			coverImage = story.coverImage;
			title = story.title
			type = .Story;
		} else if case .gallery(let gallery) = content {
			coverImage = gallery.coverImage;
			title = gallery.title;
			type = .Gallery;
		}
		
		return (title, type, coverImage);
	}
	
	override func layoutSubviews() {
		super.layoutSubviews();
		
		self.gradientLayer.frame = self.imageView.bounds;
	}
}
