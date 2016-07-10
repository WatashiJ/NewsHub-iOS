//
//  News.swift
//  NewsHub
//
//  Created by Yaxin Cheng on 2016-07-04.
//  Copyright © 2016 Yaxin Cheng. All rights reserved.
//

import UIKit

struct News: Hashable, Equatable {
	var title: String
	var content: String
	let contentLink: String
	let source: NewsSource
	var date: NSDate?
	var imageLink: String?
	var image: UIImage?
	private var imageLoaded = false
	static var imageLoader = NewsImageLoader()
	
	var hashValue: Int {
		return contentLink.hash
	}
	
	init(with json: NSDictionary) {
		title = json["title"] as! String
		content = json["content"] as! String
		contentLink = json["_id"] as! String
		source = NewsSource(rawValue: json["source"] as! String)!
		imageLink = json["img"] as? String
		if let date = json["date"] as? String {
			let dateFmt = NSDateFormatter()
			dateFmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
			self.date = dateFmt.dateFromString(date)
		}
	}
	
	var hasImage: Bool {
		return imageLink?.isEmpty ?? false
	}
	
	func downloadImage(completion: (news: News?) -> Void) {
		if imageLoaded == true {
			completion(news: self)
		} else {
			News.imageLoader.loadThumbnail(from: self) { (image, error) in
				if error != nil {
					completion(news: nil)
				} else {
					var loadedNews = self
					loadedNews.image = image
					loadedNews.imageLoaded = true
					completion(news: loadedNews)
				}
			}
		}
	}
}

func == (lhs: News, rhs: News) -> Bool {
	return lhs.contentLink == rhs.contentLink
}