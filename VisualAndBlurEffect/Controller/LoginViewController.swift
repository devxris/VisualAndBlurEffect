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
	private var vibrancyEffectView: UIVisualEffectView?
	
	lazy var label: UILabel = {
		let label = UILabel()
		label.text = "Vibrancy and blur Effect in label"
		label.textColor = .white
		label.textAlignment = .center
		label.sizeToFit()
		label.frame = self.labelBlurView.bounds
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let selectedImageIndex = Int(arc4random_uniform(UInt32(imageSet.count)))
		backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
		
		let blurEffect = UIBlurEffect(style: .light)
		blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView?.frame = view.bounds
		
		let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
		vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
		vibrancyEffectView?.frame = view.bounds
		
		guard let blurEffectView = blurEffectView, let vibrancyEffectView = vibrancyEffectView else { return }
		backgroundImageView.addSubview(vibrancyEffectView)
		backgroundImageView.addSubview(blurEffectView)
		
		labelBlurView.contentView.addSubview(label)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		blurEffectView?.frame = view.bounds
	}
	
}

