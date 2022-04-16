//
//  GFError.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 20/12/21.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This is username created an invalid request. Please, try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Plese try again."
    case alreadyInFavorites = "You've already favorite this user. You must Really like them!"
}
