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
		return view
	}()
	
	private lazy var iconView = UIImageView()
	private lazy var titleLabel = UILabel()
	private lazy var detailLabel = UILabel()
	
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
extension ProductListCell: Configurable {
	func configure(_ model: ProductViewModel) {
		titleLabel.text = model.userIdString
		detailLabel.text = model.priceString
		detailLabel.textColor = .black
		iconView.downloadFrom(link: model.imagevViewModel.image(size: 60))
	}
}

// MARK: - Setup UI
extension  ProductListCell {
	
	private func setupView() {
		selectionStyle = .none
		preservesSuperviewLayoutMargins = true
		addSubview(container)
		container.addArrangedSubview(iconView)
		container.addArrangedSubview(titleLabel)
		container.addArrangedSubview(detailLabel)
		setupLayout()
	}
	
	private func resetView() {
		iconView.image = nil
		titleLabel.text = ""
		detailLabel.text = ""
	}
	
	private func setupLayout() {
		container.anchor(top: topAnchor,
						 bottom: bottomAnchor,
						 left: layoutMarginsGuide.leftAnchor,
						 paddingLeft: -10,
						 right: layoutMarginsGuide.rightAnchor)

		iconView.anchor(width: 60, height: 60)
	}
}
