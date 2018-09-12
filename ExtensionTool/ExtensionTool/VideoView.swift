//
//  VideoPlayerView.swift
//  ExtensionTool
//
//  Created by 张崇超 on 2018/9/10.
//  Copyright © 2018年 ZCC. All rights reserved.
//

import UIKit
import AVKit

class VideoView: UIView {

    private let url: String = "http://res.supervolleyball.com/%255B%25E6%258E%2592%25E7%2590%2583%255D%25E4%25B8%2580%25E5%259C%25BA%25E5%258F%258A%25E6%2597%25B6%25E7%259A%2584%25E8%2583%259C%25E5%2588%25A9%2520%25E4%25B8%25AD%25E5%259B%25BD%25E5%25A5%25B3%25E6%258E%2592%25E9%2587%258D%25E6%258B%25BE%25E4%25BF%25A1%25E5%25BF%2583%25EF%25BC%2588%25E6%2599%25A8%25E6%258A%25A5%25EF%25BC%2589.mp4"
    private var playerLayer: AVPlayerLayer!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        self.layer.addSublayer(self.playerLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var player: AVPlayer = {
        let playerItem = AVPlayerItem.init(url: URL.init(string: self.url)!)
        let player = AVPlayer.init(playerItem: playerItem)
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspect
        self.playerLayer = playerLayer
        
        return player
    }()
    
}