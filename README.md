# MyFoodTrackerX1
FoodTracker Extra 1

Starts with finished FoodTracker, adds popover

 vc.modalPresentationStyle = .Popover

        if let pc = vc.popoverPresentationController {
        
            pc.permittedArrowDirections = .Any
            
            pc.delegate = self
            
        }


