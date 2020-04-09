//
//  Auteur.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/7.
//  Copyright © 2020 da ghua. All rights reserved.
//

import Foundation

struct Auteurs: Codable {
    var auteurs: [Auteur]
    
    static func auteursModel() -> Auteurs? {
        var auteurs: Auteurs?
        let url = Bundle.main.url(forResource: "auteurs", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            auteurs =  try JSONDecoder().decode(Auteurs.self, from: data)
        } catch {
            print("Error occured during Parsing", error)
        }
        return auteurs
    }
}

struct Auteur: Codable {
    var name: String
    var bio: String
    var image: String
    var source: String
    var films: [Film]
}
