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
//	ID: C9500418-802A-408F-B24F-B3118F0B0E3F
//
//	Pkg: GenericUtils
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import UIKit

public extension UIImageView {
	func downloadFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: (() -> Void)? = nil) {
		
		contentMode = mode
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				  let data = data, error == nil,
				  let image = UIImage(data: data) else { return }
			
			DispatchQueue.main.async() { () -> Void in
				self.image = image
				self.setNeedsDisplay()
				if let completion = completion {
					completion()
				}
			}
		}.resume()
	}
	
	func downloadFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: (() -> Void)? = nil) {
		guard let url = URL(string: link) else { return }
		downloadFrom(url: url, contentMode: mode, completion: completion)
	}
}
