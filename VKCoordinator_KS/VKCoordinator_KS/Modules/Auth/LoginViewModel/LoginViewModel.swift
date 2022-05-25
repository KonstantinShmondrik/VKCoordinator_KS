//
//  LoginViewModel.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isAuthorized: Bool = false
    @Published var userId: String = ""
    @Published var token: String = ""
    @Published var version = "5.131"
    @Published var cliendId = "7822904"
}

