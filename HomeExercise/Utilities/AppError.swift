//
//  AppError.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import Foundation
enum AppError: String, Error {
    case invalidURL           = "invalid url"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "unableToComplete"
    case invalidData        = "The data received from the server was invalid. Please try again."
}
