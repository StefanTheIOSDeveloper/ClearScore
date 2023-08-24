# ClearScore
Assessment for Clearscore

Wanted to replicate the Live Clearscore app as much as posible 

I used MVVM as my main structure of the application but also added a Singleton class to help make some of the functionality accesseble through out the application with out the need to pass data from one view to the next or to create a whole instance of a view again everytime i want to use it.

Also created a main network helper class that contains the main API and network functionality of the app. This is also reusable so all api's that will get added will be able to reuse this class and its functions.

You will see i have a folder called MAINCONTROLER that will be the base of the application wich will use the main storyboard derung run time. I found it super easy doing it this way because if you want to add on to the project by adding diffrent views or functionality you can add it by creating a new groupe like i did with the Popups this also makes it easier if you have more than one developer working on the project so they can add there work easier to the project.

if i had more time i would have added the login with biometric like in the clearscore application. Also would have add the tabbar with its navigation items and the sliding in animation on app open.

i also added comments in my code and i help that makes it easy to understand what im doing at each point/function in the application.
