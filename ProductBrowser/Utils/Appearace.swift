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
//	ID: 99EF2F83-F624-4B68-B454-DBF6572FC91E
//
//	Pkg: ProductBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit

public struct Appearance {
	
	static func apply() {
		
		// Global
		let window = UIWindow.appearance()
		window.backgroundColor = .white
		window.tintColor = .systemPink
		
		// Navigation
		let navigationBarAppearace = UINavigationBar.appearance()
		
		navigationBarAppearace.prefersLargeTitles = false
		navigationBarAppearace.barTintColor = UIColor.white
		
		navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink,
													  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
		
		navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink,
														   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 48, weight: .medium)]
		
		// UILabel
		let labelAppearace = UILabel.appearance()
		labelAppearace.text = "N/A"
		labelAppearace.textAlignment = .left
		labelAppearace.textColor = .darkGray
		labelAppearace.font = .systemFont(ofSize: 17, weight: .regular)
	}
}
