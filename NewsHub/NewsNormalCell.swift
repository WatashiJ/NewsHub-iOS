//
//  NewsNormalCell.swift
//  NewsHub
//
//  Created by Yaxin Cheng on 2016-07-08.
//  Copyright © 2016 Yaxin Cheng. All rights reserved.
//

import UIKit

class NewsNormalCell: UITableViewCell {

	@IBOutlet weak var newsImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var sourceIconView: UIImageView!
	
    override func awakeFromNib() {
			super.awakeFromNib()
			
			let mask = CAShapeLayer()
			mask.frame = newsImageView.layer.bounds
			let width = newsImageView.layer.bounds.width
			let height = newsImageView.layer.bounds.height
			
			let path = CGMutablePath()
			path.move(to: CGPoint(x: 0, y: 0))
			path.addLine(to: CGPoint(x: width, y: 0))
			path.addLine(to: CGPoint(x: width * 5 / 7, y: height))
			path.addLine(to: CGPoint(x: 0, y: height))
			path.addLine(to: CGPoint(x: 0, y: 0))
			
			mask.path = path
			mask.masksToBounds = true
			newsImageView.layer.mask = mask
			newsImageView.clipsToBounds = true
			
			sourceIconView.layer.cornerRadius = sourceIconView.bounds.width / 2
			sourceIconView.layer.masksToBounds = true
			sourceIconView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
