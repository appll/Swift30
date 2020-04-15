//
//  Film.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/7.
//  Copyright © 2020 da ghua. All rights reserved.
//

import Foundation

struct Film: Codable {
    var title: String?
    var year: String
    var poster: String
    var plot: String
    var isExpand: Bool = false
    
    // Custom init to set isExpanded bool to false / 解码
     init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       title = try container.decode(String.self, forKey: .title)
       year = try container.decode(String.self, forKey: .year)
       poster = try container.decode(String.self, forKey: .poster)
       plot = try container.decode(String.self, forKey: .plot)
       isExpand = false
     }
    
//    private enum CodingKeys: String, CodingKey {
//         case title
//         case year
//         case poster
//        case plot
//    }
}
