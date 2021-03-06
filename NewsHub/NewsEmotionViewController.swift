//
//  NewsEmitionViewController.swift
//  NewsHub
//
//  Created by Yaxin Cheng on 2016-07-28.
//  Copyright © 2016 Yaxin Cheng. All rights reserved.
//

import UIKit

class NewsEmotionViewController: UIViewController {

	var selectedEmotion: emotion?
	override func viewDidLoad() {
			super.viewDidLoad()

			// Do any additional setup after loading the view.
	}
	
	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
			// Get the new view controller using segue.destinationViewController.
			// Pass the selected object to the new view controller.
	}
	*/
	var touched: (CGPoint, UIGestureRecognizerState)! {
		didSet {
			guard let button = view.hitTest(touched.0, with: nil) as? UIButton else {
				if case .ended = touched.1 {
					dismiss(animated: true, completion: nil)
				}
				return
			}
			if case .ended = touched.1 {
				touchup(button)
			} else {
				touchdown(button)
			}
		}
	}
	
	@IBAction func touchup(_ sender: AnyObject) {
		guard let emotion = emotion(value: sender.tag) else { return }
		selectedEmotion = emotion
		performSegue(withIdentifier: Common.unwindFromEmotionIdentifier, sender: nil)
	}
	
	@IBAction func touchdown(_ sender: AnyObject) {
		let animation = CABasicAnimation(keyPath: "transform")
		animation.duration = 0.2
		animation.repeatCount = 1
		animation.autoreverses = true
		animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1.0))
		animation.fillMode = kCAFillModeForwards
		(sender as! UIButton).layer.add(animation, forKey: nil)
	}

}
