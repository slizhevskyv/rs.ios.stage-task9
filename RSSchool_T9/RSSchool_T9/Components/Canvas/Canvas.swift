//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class Canvas: UIView {
	
	var color: UIColor;
	private var path: CGPath;
	private var drawStep: CGFloat;
	private var drawTime: CGFloat;
	
	init(withPath path: CGPath, color: UIColor, andDrawTime drawTime: CGFloat) {
		self.path = path;
		self.color = color;
		self.drawTime = drawTime;
		self.drawStep = 1 / (60 * self.drawTime);
		
		super.init(frame: .zero);
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path;
		shapeLayer.fillColor = nil;
		shapeLayer.strokeEnd = 0
		self.layer.addSublayer(shapeLayer);
		
		var strokeValue:CGFloat = 0;
		Timer.scheduledTimer(withTimeInterval: 0.0166, repeats: true) { timer in
			if (strokeValue > 1) {
				timer.invalidate();
				
				return;
			}
			
			shapeLayer.strokeColor = self.color.cgColor;
			shapeLayer.strokeEnd += self.drawStep;
			strokeValue += self.drawStep;
		}
	}
	
	
	override var intrinsicContentSize: CGSize {
		self.path.boundingBox.size
	}
	
}
