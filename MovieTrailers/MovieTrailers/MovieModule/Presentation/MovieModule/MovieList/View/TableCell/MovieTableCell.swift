//
//  MovieTableCell.swift
//  MovieTrailers
//
//  Created by Toheed Jahan Khan on 29/06/22.
//

import UIKit


class MovieTableCell: UITableViewCell {
    static let reuseIdentifier = String(describing: MovieTableCell.self)
    static let height = (UIDevice.current.userInterfaceIdiom == .pad)
                                             ? CGFloat(170)
                                             : CGFloat(150)

    //MARK:- Layout:-

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var voteCount: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    
    //Text Labels
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var voteCountLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    //MARK:- View Model Movie cell
    var cellViewModel: MovieListCellViewModel? {
        didSet {
            self.setup()
            DispatchQueue.main.async {
                self.loadFonts()
                self.applyColors()
            }
            
        }
    }
    
    //MARK:- To Load Fonts
    private func loadFonts(){
        self.movieTitle.font = UIFont.fonts(name: .semiBold, size: .size_2xl)
        self.releaseDate.font = UIFont.fonts(name: .meduim, size: .size_l)
        self.rate.font = UIFont.fonts(name: .meduim, size: .size_l)
        self.voteCount.font = UIFont.fonts(name: .meduim, size: .size_l)
        self.popularity.font = UIFont.fonts(name: .meduim, size: .size_l)
        
        self.popularityLabel.font = UIFont.fonts(name: .meduim, size: .size_l)
        self.rateLabel.font = UIFont.fonts(name: .meduim, size: .size_l)
        self.voteCountLabel.font = UIFont.fonts(name: .meduim, size: .size_l)
    }

    private func applyColors(){
        self.movieTitle.textColor = DesignSystem.Colors.blueColor.color
        self.releaseDate.textColor = DesignSystem.Colors.darkLine.color
        self.rate.textColor = DesignSystem.Colors.primary.color
        self.voteCount.textColor = DesignSystem.Colors.darkLine.color
        self.popularity.textColor = DesignSystem.Colors.darkLine.color
        
        self.popularityLabel.textColor = DesignSystem.Colors.darkLine.color
        self.voteCountLabel.textColor = DesignSystem.Colors.darkLine.color
        self.rateLabel.textColor = DesignSystem.Colors.primary.color
        
    }
}

//MARK:- Network:-
extension MovieTableCell {
    
    //MARK:- Setup & Load Data
    fileprivate func setup(){
        let posterImageUrl = ApplicationConfiguration.imageEndpoint + (cellViewModel?.posterImagePath ?? "")
        posterImageView.loadImage(urlString: posterImageUrl)
        movieTitle.text = cellViewModel?.title
        releaseDate.text = cellViewModel?.releaseDate
        rate.text = cellViewModel?.rate
        voteCount.text = cellViewModel?.voteCount
        popularity.text = cellViewModel?.popularity
    }
}
