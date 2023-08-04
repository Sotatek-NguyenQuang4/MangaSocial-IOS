//
//  HomeModel.swift
//  MangaSocial
//

import Foundation

struct HomeModel: Codable {
    let id: Int
    let type: Int
    let name: String
    let data: [SwordplayModel]

}

struct SwordplayModel: Codable {
    let chapter_new: String?
    let id_chapter: String?
    let id_manga: String?
    let image_poster_link_goc: String?
    let rate: String?
    let time_release: String?
    let title_manga: String?
    let url_chapter: String?
    let url_manga: String?
}
