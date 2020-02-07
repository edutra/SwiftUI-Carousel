//
//  ContentView.swift
//  Carousel
//
//  Created by Enrique Dutra on 07/02/20.
//  Copyright © 2020 Dutra. All rights reserved.
//

import SwiftUI

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                CarouselView(numberOfImages: 4) {
                    Image("cassette")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    Image("bike")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    Image("tv")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    Image("smile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                }
            }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                    VStack(alignment: .leading) {
                        Text("Article Written By")
                            .font(.avenirNext(size: 12))
                            .foregroundColor(.gray)
                        Text("Enrique Dutra")
                            .font(.avenirNext(size: 17))
                    }
                }
                
                Text("07 Feb 2020 • 5 min read")
                    .font(.avenirNextRegular(size: 12))
                    .foregroundColor(.gray)
                
                Text("How to build a carousel")
                    .font(.avenirNext(size: 28))
                
                Text(loremIpsum)
                    .lineLimit(nil)
                    .font(.avenirNextRegular(size: 17))
            }
            .padding(.horizontal)
            .padding(.top, 16.0)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let loremIpsum = """
Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam. Tellus quis libero sociis class nec hendrerit, id proin facilisis praesent bibendum vehicula tristique, fringilla augue vitae primis turpis.
Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam. Tellus quis libero sociis class nec hendrerit, id proin facilisis praesent bibendum vehicula tristique, fringilla augue vitae primis turpis.
"""


