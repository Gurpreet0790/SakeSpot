//
//  Constants.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import SwiftUI

struct AppErrorStrings{
    static let OK = "OK"
    static let Error = "Error"
    static let INVALID_URL = "The URL provided is invalid."
    static let INVALID_DATA = "The data is not valid."
    static let UNEXPECTED_ERROR = "An unexpected error occurred."
    static let BADRESPONSE_ERROR = "Received an invalid response."
    static let DECODING_ERROR = "Failed to decode the data."
    static let NETWORK_ERROR = "A network error occurred."
}

struct AppColors{
    static let primary = Color.black
    static let secondary = Color.gray
    static let forground = Color.white
    static let theme = Color.blue
}

struct AppFonts {
    static let Title_Font = "flashrogers"
    static let subTitle_Font = "Flash-Regular"
}

struct AppTitleKeys {
    static let VISIT_WEBSITE = "Visit Website"
    static let FIND_LOCATION = "Find on Map"
    static let RETRY = "Try Again"
    static let LOADING = "Loading.."
    static let RETRY_BUTTON = "Retry"
   
}
struct AppNavTitle {
    static let HOME_NAV = "Sake Shops"
}
struct AppPlaceholderStrings{
    static let NODATA_PLACEHOLDER = "No Data Available"
    static let NOSHOP_PLACEHOLDER = "No Shop"
}
struct AppImages{
    static let SEARCHCANCLE_ICON = "xmark.circle.fill"
    static let PLACEHOLDER_IMAGE = "NoImageAvailable"
    static let RATING_ICON = "star.fill"
    static let NO_SHOP_IMAGE = "photo.fill"
    static let MAP_IMAGE = "safari"
    static let WEBSITE_IMAGE = "mappin.and.ellipse"
    static let FULLSTAR_IMAGE = "star.fill"
    static let HALFSTAR_IMAGE = "star.lefthalf.fill"
    static let EMPTYSTAR_IMAGE = "star"
    static let RETRY_IMAGE = "arrow.clockwise"
    
}
