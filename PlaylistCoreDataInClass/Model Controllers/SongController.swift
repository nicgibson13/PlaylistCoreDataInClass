//
//  SongController.swift
//  PlaylistCoreDataInClass
//
//  Created by Nic Gibson on 6/19/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    //Singleton
    //Shared Instance
    static let sharedInstance = SongController()
    
    //Cruds
    //Create
    func createNewSongWith(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    //Delete
    func deleteSong(song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
            PlaylistController.sharedInstance.saveToPersistentStore()
        }
    }
    
}
