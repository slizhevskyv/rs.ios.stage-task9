//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemDetailCoverImageView: UIView {
	private let titleLabel: UILabel = {
		let title = UILabel();
		title.font = UIFont(name: "Rockwell-Regular", size: 48);
		title.textColor = .white;
		title.numberOfLines = 3;
		
		title.translatesAutoresizingMaskIntoConstraints = false;
		
		return title;
	}()
	
	private let subtitleLabel: UITextView = {
		let subtitle = UITextView();
		subtitle.font = UIFont(name: "Rockwell-Regular", size: 24);
		
		subtitle.layer.borderWidth = 1;
		subtitle.layer.borderColor = UIColor.white.cgColor;
		subtitle.layer.cornerRadius = 8;
		
		subtitle.sizeToFit();
		
		subtitle.isEditable = false;
		
		subtitle.contentInset = UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30);
		
		subtitle.translatesAutoresizingMaskIntoConstraints = false;
		
		return subtitle;
	}()
	
	private let content: ContentType
	
	init(withContent content:ContentType) {
		self.content = content;
		
		super.init(frame: .zero);
		
		self.layer.borderWidth = 1;
		self.layer.borderColor = UIColor.white.cgColor;
		self.layer.cornerRadius = 8;
		
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupLayout() {
		let contentData = Constants.getContentData(byContent: content);
		
		let imageView = UIImageView(image: contentData.coverImage);
		imageView.layer.cornerRadius = 8;
		imageView.clipsToBounds = true;
		imageView.contentMode = .scaleAspectFill;
		self.titleLabel.text = contentData.title;
		self.subtitleLabel.text = contentData.type.rawValue;
		
		imageView.addSubview(self.titleLabel);
		self.addSubview(self.subtitleLabel);
		self.addSubview(imageView);
		
		imageView.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			self.titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
			self.titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
			self.titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -15),
			self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
		]);
		
	}

}
