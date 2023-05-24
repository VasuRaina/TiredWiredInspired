//
//  NewsModel.swift
//  TiredWiredInspired
//
//  Created by Vasu Raina on 5/21/23.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    struct Source: Codable {
        let id: String?
        let name: String
    }
    
    var id: UUID {
        return UUID() // Generate a unique identifier for each article
    }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let publishedAt: String
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}
