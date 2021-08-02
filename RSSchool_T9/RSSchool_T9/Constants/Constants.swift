//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Vladislav Slizhevsky
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation

struct Constants {
	enum ContentViewType:String {
		case Story
		case Gallery
    }
	
	typealias ContentData = (title: String, type: ContentViewType, coverImage: UIImage);
	
	static func getContentData(byContent content: ContentType) -> Constants.ContentData {
		var coverImage = UIImage();
		var title: String = "";
		var type: Constants.ContentViewType = .Story;
		
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
}
