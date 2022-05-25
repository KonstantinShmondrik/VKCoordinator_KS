//
//  TabBarView.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI

struct TabBarView: View {
    var viewModel: LoginViewModel
    
    var body: some View {
        TabView {
            
            FriendsView(viewModel: FriendsViewModel(api: FriendsAPI(viewModel: viewModel)), loginViewModel: viewModel)
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.2.circle")
                    Text("Друзья")
                }
            
            GroupsView(viewModel: GroupsViewModel(api: GroupsAPI(viewModel: viewModel)))
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Группы")
                    
                }
            NewsView()
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Новости")
                }
        }
        .navigationBarBackButtonHidden(true) // если не хотим переходить на страницу логина
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
