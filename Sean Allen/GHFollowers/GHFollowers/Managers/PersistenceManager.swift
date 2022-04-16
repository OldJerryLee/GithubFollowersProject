//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 21/03/22.
//

import Foundation

enum persistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    enum keys { static let favorites = "favorites" }

    static func updatewith(favorite: Follower, actionType: persistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):

                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }

                    favorites.append(favorite)

                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }

                completed(save(favorites: favorites))

            case .failure(let error):
                completed(error)
            }
        }
    }

    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: keys.favorites) as? Data else {
            completed(.success([]))
            return
        }

        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }

    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
