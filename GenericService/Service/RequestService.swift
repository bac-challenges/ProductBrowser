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
//	ID: 6DE33BBA-882C-49A9-8EF6-5A72594EF8CD
//
//	Pkg: GenericService
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

final class RequestService {
	
	func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
		
		guard let url = URL(string: urlString) else {
			completion(.failure(.network(string: "Wrong url format")))
			return nil
		}
		
		var request = RequestFactory.request(method: .GET, url: url)
		
		if let reachability = Reachability(), !reachability.isReachable {
			request.cachePolicy = .returnCacheDataDontLoad
		}
		
		let task = session.dataTask(with: request) { (data, response, error) in
			if let error = error {
				completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
				return
			}
			
			if let data = data {
				completion(.success(data))
			}
		}
		task.resume()
		return task
	}
}
