//
//  UserDefaultsHelper.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

struct UserDefaultsHelper: UserDefaultsHelperProtocol {

    private var userDefaults: UserDefaults = UserDefaults.standard

    func add(_ posts: [Post]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode posts
            let data = try encoder.encode(posts)

            // Write/Set Data
            userDefaults.set(data, forKey: "SavedPosts")

        } catch {
            print("Unable to Encode List (\(error))")
        }
    }

    func get() -> [Post] {
        if let posts = userDefaults.data(forKey: "SavedPosts") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode posts
                let data = try decoder.decode([Post].self, from: posts)

                return data
            } catch {
                print("Unable to Decode List (\(error))")
            }
        }
        return []
    }

    func deleteAll() {
        userDefaults.removeObject(forKey: "SavedPosts")
    }
}
