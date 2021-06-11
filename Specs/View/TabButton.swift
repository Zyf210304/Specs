//
//  TabButton.swift
//  Specs
//
//  Created by 张亚飞 on 2021/6/11.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? Color.white : Color.black)
                .padding(.vertical, 10)
                .padding(.horizontal, selected == title ? 20 : 0)
                .background(
                
                    // For Slide Effect Animation
                    ZStack {
                        
                        if selected == title {
                            
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
}

