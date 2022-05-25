//
//  PhotoAPI.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import SwiftUI


protocol PhotosService {
    func getPhotos(userId: Int, completion: @escaping([Photos])->())
}

class PhotosAPI: PhotosService {
    
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
   

    // MARK: - DTO Вызов фото друзей
    func getPhotos(userId: Int, completion: @escaping([Photos])->()) {
        let method = "/photos.getAll"
        let url = baseUrl + method
        
            self.params = [
            "owner_id": ("\(userId)"),
            "access_token": viewModel.token,
            "v": viewModel.version
        ]
        params["count"] = "100"
        
        
        AF.request(url, method: .get, parameters: params).responseData {response in
            self.request = response.request?.description
            print("вызов всех фотографий пользователя")
            //            print(response.result)
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
            let allPhotoContainer = try JSONDecoder().decode(AllPhotoContainer.self, from: jsonData)

                let photos = allPhotoContainer.response.items

                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}

