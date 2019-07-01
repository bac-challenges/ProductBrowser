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
//	ID: 59E9995E-256D-4F8D-B90B-50227CA9E1AF
//
//	Pkg: ProductBrowser	
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit

class ProductController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
}

// MARK: - UI
extension ProductController {
	private func setupView() {
		title = "Product"
		preferredDisplayMode = .allVisible
		delegate = self
		let rootController = UINavigationController(rootViewController: ProductListController())
		let detailController = UINavigationController(rootViewController: ProductDetailController())
		viewControllers = [rootController, detailController]
	}
}

// MARK: - UISplitViewControllerDelegate
extension ProductController: UISplitViewControllerDelegate {
	
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}
