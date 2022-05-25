//
//  GroupsAPI.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

// https://api.vk.com/method/METHOD?PARAMS&access_token=TO

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON

protocol GroupsService {
     func getGroups(completion: @escaping([Group])->())
 }

 class GroupsAPI: GroupsService {

     @ObservedObject var viewModel: LoginViewModel
     
     init(viewModel: LoginViewModel) {
         self.viewModel = viewModel
     }

     let baseUrl = "https://api.vk.com/method"
     var params: Parameters = [:]
     var request: String?



     //    MARK: - DTO
     func getGroups(completion: @escaping([Group])->()) {

         let method = "/groups.get"
         let url = baseUrl + method

         self.params = [
             "client_id": viewModel.cliendId,
             "user_id": viewModel.userId,
             "access_token": viewModel.token,
             "v": viewModel.version
         ]

         params["extended"] = "1"
         params["fields"] = "activity, can_create_topic, can_post, can_see_all_posts, city, contacts;, counters, country, description, finish_date, fixed_post, links, members_count, place, site, start_date, status, verified, wiki_page"
         params["count"] = "50"

         AF.request(url, method: .get, parameters: params).responseData { response in
             self.request = response.request?.description

             print("вызов групп пользователя")
             //            print( response.result)
             print(response.data?.prettyJSON)

             guard let jsonData = response.data else { return }

             do {
                 let usersGroupContainer = try JSONDecoder().decode(GroupContainer.self, from: jsonData)

                 let groups = usersGroupContainer.response.items

                 completion(groups)
             } catch {
                 print(error)
             }
         }
     }
 }



