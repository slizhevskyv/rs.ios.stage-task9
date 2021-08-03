//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation

enum ContentDataType:String {
	case Story
	case Gallery
}

struct ContentData {
	let coverImage: UIImage
	let title: String
	let text: String?
	let paths: [CGPath]?
	let images: [UIImage]?
	let type: ContentDataType
	
	static func getData(byContent content: ContentType) -> ContentData {
		switch content {
			case .gallery(let gallery):
				return ContentData(coverImage: gallery.coverImage,
								   title: gallery.title,
								   text: nil,
								   paths: nil,
								   images: gallery.images,
								   type: .Gallery);
			case .story(let story):
				return ContentData(coverImage: story.coverImage,
								   title: story.title,
								   text: story.text,
								   paths: story.paths,
								   images: nil,
								   type: .Story)
		}
		
	}
}
