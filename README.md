# SwiftAPICallTest

24.03.2022

Training 

* SwiftUI API Call with JSON
* Display Books Title
* Sorting and Searching function
* detailed view(second screen)
* MVVM design pattern

28.03.2022

Updates

* changed from @StateObject to @ObservedObject.
* removed PersistenceController

* replys for the questions.

  * Why you use your viewmodel is stateobject ?
    * I think I used “StateObject” because it does not depend on View’s lifecycle. in other words, it doesn’t create again when the View is newly created. 
It means that It can solve the problem of data loss, and this can prevent inefficient performance if there is a lot of work when the ViewModel is created. 
But, I also found out that “@ObservedObject” is a property wrapper for the most of ViewModel declarations. So I changed it from @StateObject to @ObservedObject.

  * Instead of passing book object like this can you environment object ? 
    * Honestly, I couldn’t do that. I tried to use “@Environmentobject” but it failed. I think it is because I am using “Struct” for books in my code. But I am not sure about it. Sorry about that.

  * Why you need PersistenceController?
    * I checked “Use Core Data” unconsciously when I created the project. And then PersistenceController was created automatically. But I removed it .
