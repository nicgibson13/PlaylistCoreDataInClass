//
//  PlaylistController.swift
//  PlaylistCoreDataInClass
//
//  Created by Nic Gibson on 6/19/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // Singleton
    //Shared Instance
    static let sharedInstance = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] = []
    
    // CRUD Functions
    //Create
    func createPlaylistWithName(name: String) {
        Playlist(name: name)
        saveToPersistentStore()
    }
    //Delete
    func delete(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistentStore()
        }
    }
    // Save
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
            
        }
    }
}
