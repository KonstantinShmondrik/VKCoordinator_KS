//
//  FriendViewCell.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct FriendViewCell: View {
    
    var friend: Friend
    
    var body: some View {
        HStack {
            
            LogoImageBuilder {
                WebImage(url: URL(string: friend.photo100 ?? ""))
            }
            Spacer()
            
            NameTextBuilder {
                Text("\((friend.firstName )) \(friend.lastName )")
            }
            
        }.padding(10)
        
    }
}

//struct FriendViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
//    }
//}
