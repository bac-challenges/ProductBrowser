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

class ProductHeaderCell: UITableViewCell, ReusableCell {

	public lazy var iconView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "01d")
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	public lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .left
		view.textColor = .darkGray
		view.font = .systemFont(ofSize: 17, weight: .regular)
		return view
	}()
	
	public lazy var detailLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .left
		view.textColor = .systemPink
		view.font = .systemFont(ofSize: 17, weight: .regular)
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .value1, reuseIdentifier: nil)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		iconView.image = nil
		titleLabel.text = ""
		detailLabel.text = ""
	}
}

// MARK: - Configurable
extension ProductHeaderCell: Configurable {
	func configure(_ model: ProductViewModel) {
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		iconView.downloadedFrom(link: model.imageURL) {
			self.setNeedsLayout()
		}
	}
}

// MARK: - Setup UI
extension  ProductHeaderCell {
	
	private func setupView() {
		selectionStyle = .none
		layoutMargins = UIEdgeInsets.zero
		preservesSuperviewLayoutMargins = false
		addSubview(iconView)
		addSubview(titleLabel)
		addSubview(detailLabel)
		setupLayout()
	}
	
	private func setupLayout() {
		iconView.anchor(top: topAnchor,
						paddingTop: 10,
						paddingBottom: 10,
						left: leftAnchor,
						paddingLeft: 20,
						width: 180,
						height: 180)
		
		titleLabel.anchor(top: iconView.topAnchor,
						  left: iconView.rightAnchor,
						  paddingLeft: 20)
		
		detailLabel.anchor(top: titleLabel.bottomAnchor,
						   paddingTop: 5,
						   left: titleLabel.leftAnchor)
	}
	
	override class var requiresConstraintBasedLayout: Bool {
		return true
	}
}
