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
//	ID: 8BC897EB-EF1A-4013-9405-BFB366A97959
//
//	Pkg: ProductSharedTests
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import XCTest
@testable import ProductShared

class ImageViewModelTests: XCTestCase {

	let sizes = [150, 210, 320, 480, 640, 960, 1280]
	
	let model = ImageViewModel()
	
	var formats: [Format] {
		return sizes.map {
			Format(url: "url_\($0)", width: $0, height: $0)
		}
	}
	
    func testPreferredURL() {

		let imageSize = 120*3
		let result = model.preferredURL(from: formats, width: imageSize)
		
		XCTAssertNotEqual(result!, "", "URL string can not be empty")
		XCTAssertNotNil(result, "URL string can not be nil")
		XCTAssertEqual(result!, "url_480")
    }
	
	func testPreferredFormat() {
		
		let imageSize = 120*3
		let result = model.preferredFormat(from: formats, width: imageSize)
		
		XCTAssertNotNil(result, "URL string can not be nil")
		XCTAssertNotEqual(result!.url, "", "URL string can not be empty")
		XCTAssertEqual(result!.width, 480)
	}
}
