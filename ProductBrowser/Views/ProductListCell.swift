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
//	ID: 1AF05B1E-939F-485F-BCC7-8EF10D11F9F1
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

class ProductListCell: UITableViewCell, ReusableCell {
	
	private lazy var container: UIStackView = {
		let view = UIStackView()
		view.spacing = 10
		view.axis = .horizontal
		view.distribution = .fill
		view.alignment = .center
		view.isBaselineRelativeArrangement = true
		view.isLayoutMarginsRelativeArrangement = true
		view.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 15)
		return view
	}()
	
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
extension ProductListCell: Configurable {
	func configure(_ model: ProductViewModel) {
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		iconView.downloadFrom(link: model.imageURL) {
			self.iconView.layer.cornerRadius = self.iconView.frame.height/2
			self.iconView.layer.masksToBounds = true
			self.setNeedsLayout()
		}
	}
}

// MARK: - Setup UI
extension  ProductListCell {
	
	private func setupView() {
		selectionStyle = .none
		layoutMargins = UIEdgeInsets.zero
		preservesSuperviewLayoutMargins = false
		addSubview(container)
		container.addArrangedSubview(iconView)
		container.addArrangedSubview(titleLabel)
		container.addArrangedSubview(detailLabel)
		setupLayout()
	}
	
	private func setupLayout() {
		container.anchor(top: topAnchor,
						 bottom: bottomAnchor,
						 left: leftAnchor,
						 right: rightAnchor)

		iconView.anchor(width: 60, height: 60)
	}
}
