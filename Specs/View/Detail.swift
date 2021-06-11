//
//  Detail.swift
//  Specs
//
//  Created by 张亚飞 on 2021/6/11.
//

import SwiftUI

struct Detail: View {
    
    @Binding var selectedItem: Item
    @Binding var show: Bool
    
    @State var loadContent = false
    
    @State var selectedColor : Color = Color("p2")
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 25) {
                
                Button(action: {
                    //close view
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }, label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.black)
                })
            }
            .padding()
            
            
            VStack(spacing: 10) {
                
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // since  id is conmon
                    .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                    .padding()
                
                Text(selectedItem.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "title\(selectedItem.id)", in: animation)
                
                Text(selectedItem.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: "subTitle\(selectedItem.id)", in: animation)
                
                HStack {
                    
                    Text(selectedItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                    
                   
                    Spacer(minLength: 0)
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                    })
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 10)
            }
            .padding(.top, 35)
            .background(
                Color(selectedItem.image)
                    .clipShape(CustomShape())
                    .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
            )
            .cornerRadius(10)
            .padding()
            
            // delay laoding the content for smooth animation...
            
            VStack {
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Frame + lens for \(selectedItem.price)(it's 50% off)")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                .background(Color("p3"))
                .cornerRadius(15)
                
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Color")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    HStack (spacing: 15){
                        
                        ForEach(1...4, id: \.self) { index in
                            
                            ZStack {
                                
                                Color("p\(index + 1)")
                                    .clipShape(Circle())
                                    .frame(width: 45, height: 45)
                                    .onTapGesture {
                                        
                                        withAnimation(.spring()) {
                                            selectedColor = Color("p\(index + 1)")
                                        }
                                    }
                                
                                if selectedColor == Color("p\(index + 1)") {
                                    
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        Spacer(minLength: 0)
                    }
                    
                    
                })
                .padding()
                
                
            }
            .padding([.horizontal, .bottom])
            .frame(height: loadContent ? nil : 0)
            .opacity(loadContent ? 1 : 0)
            
            Spacer(minLength: 15)
            
            Button(action: {}, label: {
            
                Text("TRY FRAME IN 3D")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
            })
            
            Button(action: {}, label: {
            
                Text("ADD TO CART")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(
                        Color.black
                    )
                    .cornerRadius(15)
                
            })
            .padding(.vertical)
            
            Spacer(minLength: 0)
        }
        .onAppear {
            
            withAnimation(Animation.spring().delay(0.45)) {
                loadContent.toggle()
            }
        }
    }
}

