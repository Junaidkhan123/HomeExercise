//
//  AppError.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
enum GFError: String, Error {
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
