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
//	ID: 76F75D27-171F-4A6C-AA80-6729B60FB15C
//
//	Pkg: GenericServiceTests
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import XCTest
@testable import GenericService

class JSONParserTests: XCTestCase {

	// Mock model
	struct Model: Codable {
		let propertyValue: String
		let propertiesValue: [String]
	}
	
	// Mock data
	var data: Data {
		let json: [String : Any] = ["property_value": "value",
									"properties_value": ["value0",
														 "value1",
														 "value2"]]
		
		return try! JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
	}
	
	func testParseEmptyData() {
		
		let data = Data()
		let completion : ((Result<Model, ErrorResult>) -> Void) = { result in
			switch result {
			case .success(_):
				XCTAssert(false, "Expected failure when no data")
			default:
				break
			}
		}
		
		JSONParser.parse(data: data, completion: completion)
    }
	
	func testParseModel() {

		let completion : ((Result<Model, ErrorResult>) -> Void) = { result in
			switch result {
			case .failure(_):
				XCTAssert(false, "Expected valid converter")
			case .success(let model):
				
				XCTAssertEqual(model.propertyValue, "value", "Expected 'value'")
				XCTAssertEqual(model.propertiesValue.count, 3, "Expected count '3'")
				XCTAssertEqual(model.propertiesValue.first, "value0", "Expected 32 rates")
			}
		}
		
		JSONParser.parse(data: data, completion: completion)
	}
}
