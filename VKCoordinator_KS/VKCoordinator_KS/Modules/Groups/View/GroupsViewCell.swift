//
//  GroupsViewCell.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI



// MARK: Content
struct GroupsViewCell: View {
    var group: Group
    
    var body: some View {
        HStack {
            
            LogoImageBuilder {
                WebImage(url: URL(string: group.photo100))
            }
            Spacer()
            
            NameTextBuilder {
                Text(group.name)
            }
            
        }.padding(10)
        
    }
}
