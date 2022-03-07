//
//  BookResponse.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import Foundation

struct BookResponse: Codable {
    let items: [Items]?
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let description: String?
    let imageLinks: ImageLinks?
}


struct Items: Codable {
    let volumeInfo: VolumeInfo?
}


struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
