//
//  CarouselView.swift
//  Carousel
//
//  Created by Enrique Dutra on 07/02/20.
//  Copyright © 2020 Dutra. All rights reserved.
//

import SwiftUI
import Combine

struct CarouselView<Content: View>: View {
    
    // The number of images that you want to show
    private var imageNumber: Int
    // Everything inside the {} of the struct creation
    private var content: Content
   
    
    // index of the image that will be shown
    @State private var currentIndex: Int = 0
    
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()


    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.imageNumber = numberOfImages
        self.content = content()
        
    }

    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing: 0){
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer){timer in
                self.currentIndex = (self.currentIndex) + 1 % self.imageNumber
            }
            
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        
     
        GeometryReader { geometry in
            CarouselView(numberOfImages: 3) {
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
            }
        }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
    }
}
