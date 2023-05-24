//
//  NewsService.swift
//  TiredWiredInspired
//
//  Created by Vasu Raina on 5/21/23.
//

import Foundation
import SwiftUI

    
    
    class NewsCall {
        func getNews(completion: @escaping ([Article]) -> Void) {
            guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=fb02ca4f451d45fea8d01ca142ec1063") else {
                print("Invalid URL")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(newsResponse.articles)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
            task.resume()
        }
    }



