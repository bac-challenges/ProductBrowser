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
	
	private lazy var container: UIStackView = {
		let view = UIStackView()
		view.spacing = 10
		view.axis = .horizontal
		view.distribution = .equalSpacing
		view.alignment = .center
		return view
	}()
	
	private lazy var separator: UIView = {
		let view = UIView()
		view.backgroundColor = .systemPink
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
		resetView()
	}
}

// MARK: - Configurable
extension ProductHeaderCell: Configurable {
	func configure(_ model: ProductViewModel) {
		resetView()
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		iconView.downloadedFrom(link: model.imageURL) {
			self.setNeedsLayout()
		}
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
		addSubview(container)
		addSubview(separator)

		//
		for _ in 0...3 {
			let view = UIView()
			view.debugMode(true)
			view.anchor(width: 40, height: 40)
			container.addArrangedSubview(view)
		}
		
		setupLayout()
	}
	
	private func resetView() {
		iconView.image = nil
		titleLabel.text = ""
		detailLabel.text = ""
		container.removeAllArrangedSubviews()
	}
	
	private func setupLayout() {
		iconView.anchor(top: layoutMarginsGuide.topAnchor,
						bottom: layoutMarginsGuide.bottomAnchor,
						left: layoutMarginsGuide.leftAnchor,
						width: 100,
						height: 100)
		
		titleLabel.anchor(top: iconView.topAnchor,
						  left: iconView.rightAnchor,
						  paddingLeft: 10)
		
		detailLabel.anchor(top: titleLabel.bottomAnchor,
						   paddingTop: 5,
						   left: titleLabel.leftAnchor)
		
		container.anchor(bottom: iconView.bottomAnchor,
						 paddingBottom: -10,
						 left: iconView.rightAnchor,
						 paddingLeft: 10,
						 height: 60)
		
		separator.anchor(top: iconView.bottomAnchor,
						 paddingTop: 10,
						 left: layoutMarginsGuide.leftAnchor,
						 right: layoutMarginsGuide.rightAnchor,
						 height: 1)
	}
}
