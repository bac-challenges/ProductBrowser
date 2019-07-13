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

class ProductDetailController: UITableViewController {

	public var model: ProductViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
	}
}

// MARK: - Setup UI
extension ProductDetailController {
	private func setupView() {
		title = "Product"
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "descrptionCell")
		tableView.register(ProductHeaderCell.self, forCellReuseIdentifier: ProductHeaderCell.identifier)
		tableView.backgroundColor = .white
		tableView.separatorStyle = .none
		tableView.estimatedRowHeight = 80
		tableView.rowHeight = UITableView.automaticDimension
	}
}

// MARK: - UITableViewDelegate
extension ProductDetailController {
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return section == 1 ? TableHeaderView(title: "Description") : nil
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return section == 1 ? 30:0
	}
}

// MARK: - UITableViewDataSource
extension ProductDetailController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: ProductHeaderCell.identifier,
													 for: indexPath) as! ProductHeaderCell
			cell.configure(model!)
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "descrptionCell", for: indexPath)
			cell.selectionStyle = .none
			cell.textLabel?.numberOfLines = 0
			cell.textLabel?.text = model?.description
			return cell
		}
	}
}

// MARK: -
private class TableHeaderView: UIView {
	
	convenience init(title: String) {
		self.init()
		let view = UILabel()
		view.font = .systemFont(ofSize: 20, weight: .regular)
		view.textColor = .black
		view.text = title
		addSubview(view)
		view.anchor(top: layoutMarginsGuide.topAnchor,
					left: layoutMarginsGuide.leftAnchor,
					paddingLeft: 10)
	}
}
