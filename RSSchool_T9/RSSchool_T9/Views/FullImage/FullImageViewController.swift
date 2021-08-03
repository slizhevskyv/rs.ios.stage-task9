//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class FullImageViewController: UIViewController {
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
	
	lazy private var scrollView:UIScrollView = {
		let scrollView = UIScrollView();
		scrollView.minimumZoomScale = 1;
		scrollView.minimumZoomScale = 3;
		scrollView.showsHorizontalScrollIndicator = false;
		scrollView.showsVerticalScrollIndicator = false;
		scrollView.delegate = self;
		
		return scrollView;
	}()
	
	private var imageView:UIImageView!;
	
	private var image: UIImage;
	
	init(withImage image:UIImage) {
		self.image = image;
		
		super.init(nibName: nil, bundle: nil);
		
		self.setupLayout();
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .black;
       
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
		
		self.view.addGestureRecognizer(tapGestureRecognizer);
    }
	
	private func setupLayout() {
		self.setupImageView();
		self.setupCloseButton();
	}
	
	private func setupImageView() {
		self.imageView = UIImageView(image: self.image);
		self.imageView.contentMode = .scaleAspectFit;
		
		self.scrollView.addSubview(self.imageView);
		self.view.addSubview(scrollView);
		
		self.imageView.translatesAutoresizingMaskIntoConstraints = false;
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
		NSLayoutConstraint.activate([
			self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			
			self.imageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
			self.imageView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor),
			self.imageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
			self.imageView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
		]);
	}
	
	private func setupCloseButton() {
		self.view.addSubview(self.closeButton);
		
		self.closeButton.addTarget(self, action: #selector(closeButtonHandler), for: .touchUpInside);
		
		NSLayoutConstraint.activate([
			self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
			self.closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			self.closeButton.widthAnchor.constraint(equalToConstant: 40),
			self.closeButton.heightAnchor.constraint(equalToConstant: 40)
		]);
	}
	
	@objc private func closeButtonHandler() {
		self.dismiss(animated: true, completion: nil);
	}
	
	override func viewDidLayoutSubviews() {
		self.closeButton.layer.cornerRadius = self.closeButton.bounds.width / 2;
	}
	
	
	@objc private func didTapView() {
		self.closeButton.isHidden = !self.closeButton.isHidden;
	}
}

extension FullImageViewController: UIScrollViewDelegate {
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		self.imageView;
	}
}
