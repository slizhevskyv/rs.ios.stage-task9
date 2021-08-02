//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class PaddingLabel: UILabel {
	var textEdgeInsets = UIEdgeInsets.zero {
		didSet { invalidateIntrinsicContentSize() }
	}
		
	override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = bounds.inset(by: textEdgeInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		let invertedInsets = UIEdgeInsets(top: -textEdgeInsets.top, left: -textEdgeInsets.left, bottom: -textEdgeInsets.bottom, right: -textEdgeInsets.right)
		return textRect.inset(by: invertedInsets)
	}
	
	override func drawText(in rect: CGRect) {
		super.drawText(in: rect.inset(by: textEdgeInsets))
	}
	
	var paddingLeft: CGFloat {
		set { textEdgeInsets.left = newValue }
		get { return textEdgeInsets.left }
	}
	
	var paddingRight: CGFloat {
		set { textEdgeInsets.right = newValue }
		get { return textEdgeInsets.right }
	}
	
	var paddingTop: CGFloat {
		set { textEdgeInsets.top = newValue }
		get { return textEdgeInsets.top }
	}
	
	var paddingBottom: CGFloat {
		set { textEdgeInsets.bottom = newValue }
		get { return textEdgeInsets.bottom }
	}

}
