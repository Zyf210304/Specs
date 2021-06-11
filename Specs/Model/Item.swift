//
//  Item.swift
//  Specs
//
//  Created by 张亚飞 on 2021/6/11.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [

    Item( title: "Vincent", subTitle: "Black Full Rim", price: "$30", rating: "3.8", image: "p2"),
    Item( title: "John Jacobs", subTitle: "Brown Torotise", price: "$45", rating: "4.9", image: "p3"),
    Item( title: "Wood Black", subTitle: "Office Glass", price: "$84", rating: "4.2", image: "p4"),
    Item( title: "Vu Abstact", subTitle: "Fashion U", price: "$65", rating: "3.5", image: "p5")
]
