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
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		print("trait: \(String(describing: previousTraitCollection?.description))")
	}
}

// MARK: - Setup UI
extension ProductDetailController {
	private func setupView() {
		tableView = UITableView(frame: CGRect.zero, style: .plain)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.identifier)
		tableView.backgroundColor = .white
		tableView.separatorStyle = .none
		tableView.estimatedRowHeight = 80
		tableView.rowHeight = UITableView.automaticDimension
	}
}

// MARK: - UITableViewDataSource
extension ProductDetailController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		if indexPath.section == 0 {
			let productCell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.identifier,
															for: indexPath) as! ProductListCell
			productCell.configure(model!)
			cell = productCell
		} else if indexPath.section == 2 {
			cell.selectionStyle = .none
			cell.textLabel?.numberOfLines = 0
			cell.textLabel?.text = model?.description
		}
		
		return cell
	}
}
