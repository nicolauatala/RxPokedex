//
//  Parse.swift
//  RxPokedex
//
//  Created by Carlos Brenneisen on 1/19/18.
//  Copyright © 2018 carlos.brenneisen. All rights reserved.
//

import Foundation

struct Parse {
    struct Pokemon {
        static func list(from: Data) -> [JSONPokemon]? {
            do { return try JSONDecoder().decode(JSONPokemonResult.self, from: from).results }
            catch let e as NSError {
                print(e.localizedDescription)
                return nil
            }
        }
    }
}

