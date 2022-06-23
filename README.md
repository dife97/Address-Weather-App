# Address-Weather-App

In Address-Weather you can find and save Brazilian addresses, checking their current weathers, just by typing a ZipCode.  

## User Stories
- [ ] User can enter a Brazilian ZipCode and see automatically its full address and current weather;
- [ ] User can save the returned address locally
- [ ] User can save the returned address in the cloud (if logged in)
- [ ] User can create an account for free
- [ ] User can check all saved addresses and manage them (delete or edit)

## Techs and Concepts
- ViewCode
- Networking with URLSession for [ViaCEP](https://viacep.com.br/) and Alamofire for current weather in [OpenWeatherAPI](https://openweathermap.org/current)
- Core Data to save address locally
- Firebase Firestore to save address in the cloud
- Firebase Auth to manage users
- MVC as pattern
- Cocoapods 

## Future refactorings
- Add some CoreAnimations
- Refactor all views to ViewCode and MVVM
- Think of more features using MapKit and/or Google Maps SDK for iOS
