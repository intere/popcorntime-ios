

import UIKit
import PopcornKit
import FloatRatingView
import AlamofireImage

class ItemViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    
    @IBOutlet var summaryTextView: TVExpandableTextView!
    @IBOutlet var ratingView: FloatRatingView!
    
    @IBOutlet var trailerButton: TVButton!
    @IBOutlet var playButton: TVButton!
    
    // iOS Exclusive
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var genreLabel: UILabel?
    
    @IBOutlet var compactConstraints: [NSLayoutConstraint] = []
    @IBOutlet var regularConstraints: [NSLayoutConstraint] = []
    
    // tvOS Exclusive
    
    @IBOutlet var seasonsButton: TVButton?
    @IBOutlet var watchlistButton: TVButton?
    @IBOutlet var watchedButton: TVButton?
    
    @IBOutlet var peopleTextView: UITextView?
    
    var environmentsToFocus: [UIFocusEnvironment] = []
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        defer { environmentsToFocus.removeAll() }
        return environmentsToFocus.isEmpty ? super.preferredFocusEnvironments : environmentsToFocus
    }
    
    var media: Media!
    
    @IBAction func play(_ sender: Any) {
        if let parent = parent as? DetailViewController {
            if let movie = media as? Movie {
                parent.chooseQuality(sender, media: movie)
            } else if let show = media as? Show {
                parent.chooseQuality(sender, media: show.latestUnwatchedEpisode()!)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        parent?.prepare(for: segue, sender: sender)
    }
}
