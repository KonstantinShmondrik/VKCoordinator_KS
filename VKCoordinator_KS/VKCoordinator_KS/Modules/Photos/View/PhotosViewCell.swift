//
//  PhotosViewCell.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosViewCell: View {
    
    var photo: Photos
    
    @State private var likeName = ""
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                WebImage(url: URL(string: photo.sizes.last?.url ?? ""))
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                //                .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height,  alignment: .center)
            }
            LikeButton()
        }
    }
    
   
    
}
