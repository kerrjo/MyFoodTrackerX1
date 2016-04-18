# MyFoodTrackerX1
FoodTracker Extra 1

Starts with finished FoodTracker, on detail view upon tapping meal photo, instead of selecting image from UIImagePickerController, presents viewController as popover

 vc.modalPresentationStyle = .Popover

        if let pc = vc.popoverPresentationController {
        
            pc.permittedArrowDirections = .Any
            
            pc.delegate = self
            
        }


