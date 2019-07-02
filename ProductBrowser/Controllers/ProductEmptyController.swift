//	MIT License
//
//	Copyright © 2019 Emile, Blue Ant Corp
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//
//	ID: 132517DF-58D4-4F6E-AD96-08EEC6DDB841
//
//	Pkg: ProductBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit

class ProductEmptyController: UIViewController {

	lazy private var imageView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "barcode")
		view.tintColor = .lightGray
		view.alpha = 0
		return view
	}()
	
	public lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.text = "Select Product".uppercased()
		view.textAlignment = .center
		view.textColor = .lightGray
		view.font = .systemFont(ofSize: 11.5, weight: .regular)
		view.alpha = 0
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		UIView.animate(withDuration: 1.5) {
			self.imageView.alpha = 0.4
			self.titleLabel.alpha = 1
		}
	}
}

// MARK: - UI
extension ProductEmptyController {
	private func setupView() {
		view.backgroundColor = .groupTableViewBackground
		view.addSubview(imageView)
		view.addSubview(titleLabel)
		setupLayout()
	}
	
	private func setupLayout() {
		imageView.anchor(width: 100,
						 height: 100,
						 centerX: view.centerXAnchor,
						 centerY: view.centerYAnchor)
		
		titleLabel.anchor(top: imageView.bottomAnchor,
						  paddingTop: 0,
						  centerX: imageView.centerXAnchor)
	}
}
