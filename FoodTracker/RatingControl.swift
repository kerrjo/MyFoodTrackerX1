//
//  RatingControl.swift
//  FoodTracker
//
//  Created by JOSEPH KERR on 3/2/16.
//  Copyright © 2016 JOSEPH KERR. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5
    
    // MARK: initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            
            let button = UIButton (frame: CGRect(x:0,y: 0,width: 44,height: 44))

            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            // Question:  square brackets
            button.setImage(filledStarImage, forState: [.Selected,.Selected])
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            // Question:  square brackets
            ratingButtons += [button]
            
            addSubview(button)
            
            //        addSubview(<#T##view: UIView##UIView#>)
        }

    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index,button) in ratingButtons.enumerate() {

            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    
    override func intrinsicContentSize() -> CGSize {

        let buttonSize = Int(frame.size.height)
        
        let width = (buttonSize + spacing) * stars

        return CGSize(width: width, height: buttonSize)
    }
    

    // MARK: Button Action
    
    func ratingButtonTapped (button: UIButton) {
        
        rating = ratingButtons.indexOf(button)!  + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index,button) in ratingButtons.enumerate() {
            // if the index of the button is less than the rating that button should be selected
            button.selected = index < rating
        }
        
    }
}
