//
//  CardView.swift
//  Specs
//
//  Created by 张亚飞 on 2021/6/11.
//

import SwiftUI

struct CardView: View {
    
    var item: Item
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer(minLength: 0)
                
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                
            }
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                .padding()
            
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .matchedGeometryEffect(id: "title\(item.id)", in: animation)
            
            Text(item.subTitle)
                .font(.caption)
                .foregroundColor(.gray)
                .matchedGeometryEffect(id: "subTitle\(item.id)", in: animation)
            
            HStack {
                
                Button(action: {}, label: {
                    
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                })
                
                Spacer(minLength: 0)
                
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
        }
        .padding(.bottom)
        .background(
            Color(item.image)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation)
        )
        .cornerRadius(15)
        
    }
}


