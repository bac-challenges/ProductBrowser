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
//	ID: 417DB319-6DC8-45AC-8689-D5C38081E6D3
//
//	Pkg: GenericUtils
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

class DynamicValue<T> {
	
	typealias CompletionHandler = ((T) -> Void)
	
	var value : T {
		didSet {
			self.notify()
		}
	}
	
	private var observers = [String: CompletionHandler]()
	
	init(_ value: T) {
		self.value = value
	}
	
	public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
		observers[observer.description] = completionHandler
	}
	
	public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
		self.addObserver(observer, completionHandler: completionHandler)
		self.notify()
	}
	
	private func notify() {
		observers.forEach({ $0.value(value) })
	}
	
	deinit {
		observers.removeAll()
	}
}
