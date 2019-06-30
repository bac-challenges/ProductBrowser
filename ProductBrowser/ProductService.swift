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
//	ID: 57AEBC4C-1F62-45DC-AA48-7A9E27B60E5A
//
//	Pkg: ProductBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation
import ProductModel
import GenericService


protocol ProductServiceProtocol: class {
	func fetchForecast(_ completion: @escaping ((Result<Response, ErrorResult>) -> Void))
}

final class ProductService: RequestHandler, ProductServiceProtocol {

	static let shared = ProductService()

	let endpoint = "https://api.garage.me/api/v1/products/popular/?limit=1&offset_id" //"\(apiBase)/\(apiPath)?q=\(apiLocation)&appid=\(apiKey)&units%20=\(apiUnits)"
	var task: URLSessionTask?
	
	func fetchForecast(_ completion: @escaping ((Result<Response, ErrorResult>) -> Void)) {
		self.cancelFetchForecast()
		
		task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
	}
	
	func cancelFetchForecast() {
		
		if let task = task {
			task.cancel()
		}
		task = nil
	}
}
