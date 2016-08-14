

This was a test for FarmLead. Here are the steps that I have taken to complete the test:

Here's what I did: 

I created a splash page. I edited the storyboard in the regular-compact size class so that I could adjust size classes later and just build for smaller size 
classes for now. 

I used the AlamoFire Cocoapod to download the commodity unit list from the API and cached in using NSCache.
I created a shared instance as a singleton to be shared with other viewControllers.

I had the onboarding pages load after a delay so the user would have time to see the beautiful picture.

I used a UIPageViewController to control the page navigation. 

I had a modal view pop up after the user had swiped to the last page. This is where the user settings are set.

I made an API call with Alamofire after the user typed three letters into the citytextfield. I am intending to call this after a 
notification is sent after a user types the second letter but I haven't changed it yet. 

A delegate is set to send the user's selection back to the viewController to change the city field and to later set the value in
NSUserDefaults.

(was planning to make this a popover view that is small but I haven't been able to implement this yet)

When the user selects the commodity unit label, they are directed to the tableView which gets the cached city values for the 
tableView.

Things to do still:

-make the two tableViewControllers present modally over the user settings pop up. 
-make labels/textFields change when users select the values from the tableViews
-have the user setting values save in NSUserDefaults
-adjust views for retina display and ipad sizes



