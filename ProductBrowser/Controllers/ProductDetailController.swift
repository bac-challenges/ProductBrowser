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
//	ID: C5DEF9C9-EB68-4811-B90E-670673AD1452
//
//	Pkg: ProductBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit
import ProductShared
import GenericUtils

class ProductDetailController: UIViewController {

	private lazy var scrollView: UIScrollView = {
		let view = UIScrollView()
		view.isDirectionalLockEnabled = true
		return view
	}()
	
	private lazy var container: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 10
		view.alignment = .top
		view.distribution = .fill
		return view
	}()
	
	private lazy var imageView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "barcode")
		view.tintColor = .darkGray
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .left
		view.textColor = .darkGray
		view.font = UIFont.systemFont(ofSize: 17, weight: .light)
		return view
	}()
	
	private lazy var detailLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .left
		view.textColor = .systemPink
		view.font = UIFont.systemFont(ofSize: 17, weight: .light)
		return view
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .left
		view.textColor = .darkGray
		view.font = UIFont.systemFont(ofSize: 17, weight: .light)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
	}
}

// MARK: - Configurable
extension ProductDetailController: Configurable {
	func configure(_ model: ProductViewModel) {
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		imageView.downloadedFrom(link: model.imageURL) {
			self.view.setNeedsLayout()
		}
		descriptionLabel.text = model.description
	}
}

// MARK: - Setup UI
extension ProductDetailController {
	private func setupView() {
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true
		view.backgroundColor = .white
		view.addSubview(container)
		container.addArrangedSubview(imageView)
		container.addArrangedSubview(titleLabel)
		container.addArrangedSubview(detailLabel)
		container.addArrangedSubview(descriptionLabel)
		
		setupLayout()
	}
	
	private func setupLayout() {
		container.anchor(top: view.topAnchor,
						 paddingTop: 60,
						 left: view.leftAnchor,
						 paddingLeft: 40,
						 right: view.rightAnchor,
						 paddingRight: 40)
		
		imageView.anchor(width: 100, height: 100)
		
		// Debug
		imageView.debugMode(true)
		titleLabel.debugMode(true)
		detailLabel.debugMode(true)
		descriptionLabel.debugMode(true)
	}
}

