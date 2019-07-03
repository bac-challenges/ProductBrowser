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
//	ID: CF975B8B-83B8-478C-A088-75578E4E991C
//
//	Pkg: GenericServiceTests
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import XCTest
@testable import GenericService

class JSONParameterEncoderTests: XCTestCase {

    func testJSONEncoding() {
		guard let url = URL(string: "https://www.network.com/") else {
			XCTAssertTrue(false, "Could not instantiate url")
			return
		}
		var urlRequest = URLRequest(url: url)
		let parameters: Parameters = [
			"UserID": 1,
			"Name": "emile",
			"Email": "emile@network.com",
			"IsCool": true]
		do {
			let encoder = JSONParameterEncoder()
			try encoder.encode(urlRequest: &urlRequest, with: parameters)
			
			guard urlRequest.httpBody != nil else {
				XCTAssertTrue(false, "JSON paramers are nil.")
				return
			}
			
			
		} catch {}
    }
}
