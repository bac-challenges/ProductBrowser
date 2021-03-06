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
//	ID: 6A46B76B-AA0D-4095-97F7-BAF0B89D8649
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

class ProductListController: UITableViewController {

	var items: [Product]? {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		fetchItems()
	}
}

// MARK: - Service
extension ProductListController {
	private func fetchItems() {
		ProductService.shared.fetchProducts { result in
			switch result {
			case .success(let response): self.items = response.products
			case .failure(let error): print(error)
			}
		}
	}
}

// MARK: - UI
extension ProductListController {
	private func setupView() {
		title = "Products"
		tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.identifier)
		tableView.backgroundColor = .white
		tableView.rowHeight = 80
	}
}

// MARK: - UITableViewDelegate
extension ProductListController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let item = items?[indexPath.row] {
			let child = ProductDetailController()
			child.model = ProductViewModel(item)
			let navController = UINavigationController(rootViewController: child)
			self.navigationController?.showDetailViewController(navController, sender: nil)
		}
	}
}

// MARK: - UITableViewDataSource
extension ProductListController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier = ProductListCell.identifier
		guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ProductListCell,
			  let item = items?[indexPath.row] else {
				return UITableViewCell()
		}
		cell.configure(ProductViewModel(item))
		return cell
	}
}
