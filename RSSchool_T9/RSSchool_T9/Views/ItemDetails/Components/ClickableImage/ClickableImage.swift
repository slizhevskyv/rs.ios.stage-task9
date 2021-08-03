//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ClickableImage: UIControl {

	private(set) var image:UIImage;
	
	init(withImage image: UIImage) {
		self.image = image;
		
		super.init(frame: .zero);
		
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupLayout() {
		self.layer.cornerRadius = 8;
		self.layer.borderWidth = 1;
		self.layer.borderColor = UIColor.white.cgColor;
		let imageView = UIImageView(image: self.image);
		imageView.layer.cornerRadius = 4;
		imageView.contentMode = .scaleAspectFill;
		imageView.clipsToBounds = true;
		
		self.addSubview(imageView);

		imageView.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
		]);
	}
}
