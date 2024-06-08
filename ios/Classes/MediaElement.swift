//
//  MediaElement.swift
//  
//
//  Created by Suleman Imdad on 6/8/24.
//

import Foundation

// Define your Swift classes corresponding to Dart classes
enum MediaElementType: String, Codable {
    case  videos,
          quran,
          studies,
          songs,
          youtubeVideos,
          youtubeAudios
}

struct MediaElement: Codable {
    let id: String
    let number: Int
    let duration: Int
    let title: String
    let thumbnailURL: String
    let mediaURL: String
    let mediaElementType: MediaElementType
    let timePlayed: Int?
    let artist: String
}

// Parse JSON data to an array of MediaElement structs
func parseMediaElements(jsonData: Data) {
    do {
        let decoder = JSONDecoder()
        let elements = try decoder.decode([MediaElement].self, from: jsonData)
        
        for element in elements {
            print("ID: \(element.id)")
            print("Number: \(element.number)")
            print("Duration: \(element.duration)")
            print("Title: \(element.title)")
            print("Thumbnail URL: \(element.thumbnailURL)")
            print("Media URL: \(element.mediaURL)")
            print("Media Type: \(element.mediaElementType)")
            print("Time Played: \(element.timePlayed ?? -1)")
            print("Artist: \(element.artist)")
            print("")
        }
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
