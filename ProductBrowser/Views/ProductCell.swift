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
import ProductModel

class ProductCell: UITableViewCell, ReusableCell {

	private lazy var iconView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "barcode")
		view.tintColor = .darkGray
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .right
		view.textColor = .darkGray
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = UIFont.systemFont(ofSize: 18, weight: .light)
		return view
	}()
	
	private lazy var detailLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .right
		view.textColor = .darkGray
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = UIFont.systemFont(ofSize: 18, weight: .light)
		return view
	}()
	
	private lazy var subtitleLabel: UILabel = {
		let view = UILabel()
		view.text = "N/A"
		view.textAlignment = .right
		view.textColor = .darkGray
		view.translatesAutoresizingMaskIntoConstraints = false
		view.font = UIFont.systemFont(ofSize: 18, weight: .light)
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: CellStyle.value1, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ProductCell: Configurable {
	
	func configure(_ item: Product) {
		//	cell.title.text = "User ID: \(item.userId)"
		//	cell.detailTextLabel?.text = "Price: \(item.priceAmount)\(item.priceCurrency)"
	}
}

// MARK: - Setup UI
extension  ProductCell {
	
	private func setupView() {
		selectionStyle = .none
		addSubview(iconView)
		addSubview(titleLabel)
		addSubview(detailLabel)
		addSubview(subtitleLabel)
		setupLayout()
	}
	
	private func setupLayout() {
	
	}
	
	override class var requiresConstraintBasedLayout: Bool {
		return true
	}
}
