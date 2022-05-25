//
//  FriendsViewModel.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI


class FriendsViewModel: ObservableObject {
    
    let api: FriendsService
    
    @Published var friends: [Friend] = []
    
    init(api: FriendsService) {
        self.api = api
    }
    
    public func fetch() {
        api.getFriends { [weak self] friends in
                 guard let self = self else { return }
            self.friends = friends!.response.items
             }
         }
}

