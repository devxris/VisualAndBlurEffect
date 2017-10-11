//
//  LoginViewController.swift
//  VisualAndBlurEffect
//
//  Created by Chris Huang on 11/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var labelBlurView: UIVisualEffectView!
	
	private let imageSet = ["cloud", "coffee", "food", "pmq", "temple"]
	
	private var blurEffectView: UIVisualEffectView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let selectedImageIndex = Int(arc4random_uniform(UInt32(imageSet.count)))
		backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
		
		let blurEffect = UIBlurEffect(style: .light)
		blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView?.frame = view.bounds
		backgroundImageView.addSubview(blurEffectView!)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		blurEffectView?.frame = view.bounds
	}
	
}

