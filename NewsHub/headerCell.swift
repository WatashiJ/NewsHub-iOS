//
//  headerCell.swift
//  NewsHub
//
//  Created by Yaxin Cheng on 2016-07-08.
//  Copyright © 2016 Yaxin Cheng. All rights reserved.
//

import UIKit

class headerCell: UITableViewCell {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var settingButton: UIButton!
	
	@IBAction func settingPressed(_ sender: AnyObject) {
		let animation = CABasicAnimation(keyPath: "transform")
		animation.duration = 0.2
		animation.repeatCount = 1
		animation.autoreverses = true
		animation.isRemovedOnCompletion = true
		animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.1, 1.1, 1.0))
		animation.fillMode = kCAFillModeForwards
		(sender as! UIButton).layer.add(animation, forKey: "scale")
	}
}
