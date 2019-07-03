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
//	ID: DAE66AF9-6D85-4BFF-8648-BD807207B3C9
//
//	Pkg: ProductShared
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import Foundation

public struct Product: Codable {
	
	// Primary
	public let userId: Int
	public let priceAmount: String
	public let priceCurrency: String
	public let picturesData: [Picture]
	
	// Secondary
	public let description: String
	
	// Not used
//	let variantSet: Int
//	let quantity: Int
//	let createdDate: Date
//	let brandId: String
//	let activeStatus: String
//	let country: String
//	let slug: String
//	let pubDate: Date
//	let nationalShippingCost: Float
//	let id: Int
//	let handDelivery: Bool
//	let internationalShippingCost: Float
//	let status: String
//	let purchaseViaPaypal: Bool
//	let categories: [Int]
//	let address: String
//	let videos: String
//	let userData: UserData
//	let variants: String
}
