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
//	ID: F4522544-5742-4B4C-BEF1-3D490DCF6BAD
//
//	Pkg: ProductShared
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation
import GenericUtils
import GenericService

public struct ProductViewModel: GenericViewModel {
	public let model: Product
	public init(_ model: Product) {
		self.model = model
	}
}

// MARK: - Values
extension ProductViewModel {
	
	public var userIdString: String {
		return "ID: \(model.userId)"
	}
	
	public var priceString: String {
		return "\(model.priceAmount)\(model.priceCurrency)"
	}
	
	public var description: String {
		return model.description
	}
	
	public var imageURL: String {
		guard let url = model.picturesData.first?.formats["P2"]?.url else {
			return ""
		}
		
		return url
	}
}
