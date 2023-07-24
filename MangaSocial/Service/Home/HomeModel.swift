//
//  HomeModel.swift
//  MangaSocial
//

import Foundation

struct HomeModel: Codable {
    let id: Int
    let id_toan_bo_su_kien: Int
    let link_da_swap: String?
    let link_nam_goc: String?
    let link_nu_goc: String?
    let noi_dung_su_kien: String
    let real_time: String
    let so_thu_tu_su_kien: Double
    let ten_su_kien: String
}

struct UploadImage: Codable {
    let success: Bool
    let status: Int
}

struct UploadImageData: Codable {
    let id: String
}
