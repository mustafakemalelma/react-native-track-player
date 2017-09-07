//
//  MPNowPlayingInfoCenter+AudioItem.swift
//  AudioPlayer
//
//  Created by Kevin DELANNOY on 27/03/16.
//  Copyright © 2016 Kevin Delannoy. All rights reserved.
//

import MediaPlayer

extension MPNowPlayingInfoCenter {
    /// Updates the MPNowPlayingInfoCenter with the latest information on a `AudioItem`.
    ///
    /// - Parameters:
    ///   - item: The item that is currently played.
    ///   - duration: The item's duration.
    ///   - progression: The current progression.
    ///   - playbackRate: The current playback rate.
    func ap_update(with item: Track, duration: TimeInterval?, progression: TimeInterval?, playbackRate: Float) {
        var info = [String: Any]()
        info[MPMediaItemPropertyTitle] = item.title
        info[MPMediaItemPropertyArtist] = item.artist
        
        if let album = item.album {
            info[MPMediaItemPropertyAlbumTitle] = album
        }
//        if let artwork = item.artwork {
//            info[MPMediaItemPropertyArtwork] = artwork
//        }
        if let duration = duration {
            info[MPMediaItemPropertyPlaybackDuration] = duration
        }
        if let progression = progression {
            info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = progression
        }
        info[MPNowPlayingInfoPropertyPlaybackRate] = playbackRate

        nowPlayingInfo = info
    }
}
