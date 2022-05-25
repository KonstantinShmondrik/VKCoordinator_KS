//
//  FriendsView.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI

// MARK: Content
struct FriendsView: View {
    
    
    @ObservedObject var viewModel: FriendsViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    
    init(viewModel: FriendsViewModel, loginViewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.loginViewModel = loginViewModel
    }
    
    var body: some View {
        List(viewModel.friends.sorted(by: { $0.lastName < $1.lastName })) { friend in
            
            NavigationLink(destination: FriendPhotosView(viewModel: PhotosViewModel(friend: friend, api: PhotosAPI(viewModel: loginViewModel) ))) {
                FriendViewCell(friend: friend)
            }
            
        }
        .onAppear { viewModel.fetch() }
        
    }
}


// MARK:  Previews
//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
//    }
//}
