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
//	ID: F1752C69-506D-411A-9E70-AB563914137E
//
//	Pkg: GenericService
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

open class RequestHandler {
	
	let reachability = Reachability()!
	
	public init(){}
	
	public func networkResult<T: Codable>(completion: @escaping ((Result<[T], ErrorResult>) -> Void)) -> ((Result<Data, ErrorResult>) -> Void) {
		
		return { dataResult in
			
			DispatchQueue.global(qos: .background).async(execute: {
				switch dataResult {
				case .success(let data):
					JSONParser.parse(data: data, completion: completion)
					break
				case .failure(let error) :
					print("Network error \(error)")
					completion(.failure(.network(string: "Network error " + error.localizedDescription)))
					break
				}
			})
		}
	}
	
	public func networkResult<T: Codable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) -> ((Result<Data, ErrorResult>) -> Void) {
		
		return { dataResult in
			
			DispatchQueue.global(qos: .background).async(execute: {
				switch dataResult {
				case .success(let data):
					JSONParser.parse(data: data, completion: completion)
					break
				case .failure(let error) :
					print("Network error \(error)")
					completion(.failure(.network(string: "Network error " + error.localizedDescription)))
					break
				}
			})
		}
	}
}
