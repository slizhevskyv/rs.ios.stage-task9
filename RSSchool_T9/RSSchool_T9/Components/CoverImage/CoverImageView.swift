//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CoverImageView: UIImageView {
	private var gradientLayer: CAGradientLayer = {
		let gradient = CAGradientLayer();
		
		gradient.colors = [
			UIColor(named: "GradientStartColor")!.cgColor,
			UIColor(named: "GradientEndColor")!.cgColor,
		];
		
		gradient.locations = [0.75, 1];
		
		return gradient;
	}();
	
	lazy private(set) var titleLabel:UILabel = {
		let title = PaddingLabel();
		title.font = UIFont(name: "Rockwell-Regular", size: 16)
		title.textColor = .white;
		title.paddingTop = 5;

		return title;
	}()
	
	lazy private(set) var subtitleLabel:UILabel = {
		let subtitle = PaddingLabel();
		subtitle.font = UIFont(name: "Rockwell-Regular", size: 12);
		subtitle.textColor = UIColor(named: "PreviewTileSubtitleColor")
		subtitle.paddingTop = 2;
		
		return subtitle;
	}()
	
	override init(image: UIImage?) {
		super.init(image: image);
		
		self.contentMode = .scaleAspectFill;
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupLayout() {
		self.layer.cornerRadius = 10;
		self.layer.borderWidth = 1;
		self.clipsToBounds = true;
		self.contentMode = .scaleAspectFill;
		self.layer.insertSublayer(self.gradientLayer, at: 0);
		
		self.addSubview(self.titleLabel);
		self.addSubview(self.subtitleLabel);
		
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
		self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false;
		
		let leadingConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10);
		leadingConstraint.priority = .defaultHigh;
		let bottomConstraint = self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30);
		bottomConstraint.priority = .defaultHigh;
		
		
		NSLayoutConstraint.activate([
			leadingConstraint,
			self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			bottomConstraint,
			self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 3),
		]);
	}
	
	override func layoutSubviews() {
		super.layoutSubviews();
		
		self.gradientLayer.frame = self.bounds;
	}
	
}
