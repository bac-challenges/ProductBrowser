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

	let imageSizeCorrect = 360
	let imageSizeIncorrect = 3600
	
	let sizes = [150, 210, 320, 480, 640, 960, 1280]
	
	var formats: [String: Format] {
		return sizes.reduce([String: Format]()) { (dict, size) -> [String: Format] in
			var dict = dict
			dict["P\(size)"] = Format(url: "url_\(size)", width: size, height: size)
			return dict
		}
	}
	lazy var format = formats.map { $0.value }
	
	var pictures: [Picture] {
		return sizes.map {
			Picture(id: $0, formats: formats)
		}
	}
	
	lazy var model = ImageViewModel(model: pictures)
	
	func testPreferredImagesLocation() {
		let result = model.preferredImagesLocation(from: pictures, width: imageSizeCorrect)
		XCTAssertNotNil(result, "Format can not be nil")
	}
	
	func testPreferredImagesFormat() {
		let result = model.preferredImagesFormat(from: pictures, width: imageSizeCorrect)
		XCTAssertNotNil(result, "Format can not be nil")
	}
	
    func testPreferredLocation() {
		let result = model.preferredLocation(from: format, width: imageSizeCorrect)
		XCTAssertNotEqual(result, "", "URL string can not be empty")
		XCTAssertNotNil(result, "URL string can not be nil")
		XCTAssertEqual(result, "url_480")
    }
		
	func testPreferredFormat() {
		let result = model.preferredFormat(from: format, width: imageSizeCorrect)
		XCTAssertNotNil(result, "Format can not be nil")
		XCTAssertNotEqual(result.url, "", "Format string can not be empty")
		XCTAssertEqual(result.width, 480)
	}
	
	func testPreferredIndex() {
		let result = model.preferredIndex(from: format, width: imageSizeCorrect)
		XCTAssertEqual(result, 3)
	}
}
