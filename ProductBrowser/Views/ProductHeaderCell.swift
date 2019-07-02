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
//	ID: CCB0C2DF-C27D-4645-A539-FF79E3864A69
//
//	Pkg: ProductBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit
import ProductShared
import GenericService
import GenericUtils

class ProductHeaderCell: UITableViewCell, ReusableCell {

	private lazy var iconView = UIImageView()
	private lazy var titleLabel = UILabel()
	private lazy var detailLabel = UILabel()
	private lazy var gallery = ProductGalleryView()
	private lazy var separator = UIView.separator
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .value1, reuseIdentifier: nil)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		resetView()
	}
}

// MARK: - Configurable
extension ProductHeaderCell: Configurable {
	func configure(_ model: ProductViewModel) {
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		detailLabel.textColor = .systemPink
		iconView.downloadFrom(link: model.imageURL)
		gallery.items = model.imageGallery as? [String]
	}
}

// MARK: - UI
extension  ProductHeaderCell {
	
	private func setupView() {
		selectionStyle = .none
		preservesSuperviewLayoutMargins = true
		addSubview(iconView)
		addSubview(titleLabel)
		addSubview(detailLabel)
		addSubview(gallery)
		addSubview(separator)
		setupLayout()
	}
	
	private func resetView() {
		iconView.image = nil
		titleLabel.text = ""
		detailLabel.text = ""
		gallery.items = []
	}
	
	private func setupLayout() {
		iconView.anchor(top: layoutMarginsGuide.topAnchor,
						bottom: layoutMarginsGuide.bottomAnchor,
						paddingBottom: 10,
						left: layoutMarginsGuide.leftAnchor,
						width: 120,
						height: 120)
		
		titleLabel.anchor(top: iconView.topAnchor,
						  left: iconView.rightAnchor,
						  paddingLeft: 10)
		
		detailLabel.anchor(top: titleLabel.bottomAnchor,
						   paddingTop: 5,
						   left: titleLabel.leftAnchor)
		
		gallery.anchor(bottom: iconView.bottomAnchor,
						 left: iconView.rightAnchor,
						 paddingLeft: 10)
		
		separator.anchor(top: iconView.bottomAnchor,
						 paddingTop: 20,
						 left: layoutMarginsGuide.leftAnchor,
						 right: layoutMarginsGuide.rightAnchor,
						 height: 1)
	}
}
