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
//	ID: 6027BD58-9E7E-4026-A770-D8CC499D129A
//
//	Pkg: ProductShared
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

public struct ImageViewModel {
	
	public enum Quality: Int {
		case x1 = 1
		case x2 = 2
		case x3 = 3
	}
	
	var model: [Picture]
	
	public func gallery(size: Int, quality: Quality = .x3) -> [String] {
		return preferredImagesLocation(from: model, width: size * quality.rawValue)
	}
	
	public func image(size: Int, quality: Quality = .x3) -> String {
		return gallery(size: size * quality.rawValue).first!
	}
}

// MARK: - Prefered Resolution Helpers
extension ImageViewModel {

	public func preferredImagesLocation(from images: [Picture], width: Int) -> [String] {
		return images.map {
			preferredLocation(from: $0.formats.map { $1 }, width: width)
		}
	}
	
	public func preferredImagesFormat(from images: [Picture], width: Int) -> [Format] {
		return images.map {
			preferredFormat(from: $0.formats.map { $1 }, width: width)
		}
	}
	
	public func preferredLocation(from formats: [Format], width: Int) -> String {
		return preferredFormat(from: formats, width: width).url
	}
	
	public func preferredFormat(from formats: [Format], width: Int) -> Format {
		return formats.sorted { $0.width < $1.width }
					  .first(where: { $0.width >= width })!
	}
	
	public func preferredIndex(from formats: [Format], width: Int) -> Int {
		return formats.sorted { $0.width < $1.width }
					  .firstIndex(where: { $0.width >= width }) ?? 0
	}
}
