//
//  DTCCharacterViewController.swift
//  StarWarsReloaded
//
//  Created by David de Tena on 12/05/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class DTCCharacterViewController: UIViewController, AVAudioPlayerDelegate {

    // MAKE - Properties
    var model:DTCStarWarsCharacter
    var audioPlayer: AVAudioPlayer?
    
    // MAKE - Outlets
    @IBOutlet weak var imageView: UIImageView!

    
    // INIT
    init(model: DTCStarWarsCharacter){
        self.model = model
        super.init(nibName: "DTCCharacterViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sync view with model data
        syncViewWithModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Sync UI
    func syncViewWithModel(){
        imageView.image = self.model.image
        self.title = self.model.name
    }

    
    // MARK: - Action methods    
    @IBAction func playSound(sender: AnyObject) {

        let path = NSBundle.mainBundle().pathForResource(self.model.sound, ofType:"caf")
        let fileURL = NSURL(fileURLWithPath: path!)
        
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        if let err = error {
            println("audioPlayer error \(err.localizedDescription)")
        } else {
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
    
    
    @IBAction func goToWikipedia(sender: AnyObject) {
        
    }
    
}
