//
//  PostModel.swift
//  haker-SwiftUI
//
//  Created by asmaa gamal  on 05/06/2024.
//

import Foundation
struct PostModel: Codable {
    let hits: [HitModel]
}

struct HitModel: Codable, Hashable {
    let title: String
    let url:String?
}

