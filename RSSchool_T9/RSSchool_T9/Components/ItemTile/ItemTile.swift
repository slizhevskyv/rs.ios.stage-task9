//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/1/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemTile: UIControl {
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
		
		let contentData = Constants.getContentData(byContent: content);
		let coverImageView = CoverImageView(image: contentData.coverImage);
		coverImageView.titleLabel.text = contentData.title;
		coverImageView.subtitleLabel.text = contentData.type.rawValue;
		
		self.addSubview(coverImageView);
		coverImageView.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			coverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			coverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
		]);
	}
}
