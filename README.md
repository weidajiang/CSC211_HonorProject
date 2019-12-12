# CSC211H Project
IOS VR VIDEO PLAYER
# Project Description:
My honor project is to create a IOS Virtual Reality Video Player. The app will generate and scan different QR codes that I provide to play different videos.

## Weekly plan

* Week 1 - come out with a solution(What language, framework, device)
* Week 2 - decide to use Google VR SDK for IOS (Objective-C Version)\n
* Week 3 – consider how to use native camera component to scan QR code and look up online materials 
* Week 4 - implement the project


### Software Setup:
* Mac, IPhone, Xcode, Google CardBoard
* Xcode: Go to Apple Store and download the Xcode 
* Google CardBoard:
* Purchase Link: https://store.google.com/us/config/google_cardboard?sku=_google_cardboard_double&gclid=CjwKCAiA58fvBRAzEiwAQW-hzeS24ejXaMbdp1ej6KYjZeB74iu0hdATcsPXxoVHBjBFcbpO3eA7LBoCraEQAvD_BwE&gclsrc=aw.ds 

### Software Design
* Step1 : Main Screen with generate QR code and Scan QR code buttons

* Step2: if user click Generate QR Code button, then user need to put the name of video in the text box

* Step3: if user click Scan QR code button, then call the IOS native camera to scan the QR code 

* Step4: Scan the QR code and fetch the data, if video exist, then play the video. Otherwise, provide a invalid video URL message to user. 


### User Cases:


* BMCC Tour App: 

* For many freshmen, they haven’t been to BMCC and don’t know how to get there or they don’t know         where Admission Office, Financial Office, or Academic Advisement and Transfer Center is.Make some videos showing how to get from the subway station to Fiterman, Murray, or Main Building, or showing where some of the BMCC departments are.

* Virtual Course Introduction:

* Many students don‘t know how to choose a course. We can make some short course introduction videos (if necessary, the professors can show some 3D models, such as physics class, showing some equipment for physics experiments). This will be a good way to attract students.

### Conclusion:
* It is my first time using Objective -C(OC) to create a IOS App. The main challenge is definitely the syntax of OC. However, OC is also an object-oriented programming language. So, the general concept of programming has not changed. I can use what I learned in CSC111 and CSC211 class and apply it to Objective – C.

### Future Work:

* Currently, When I install the APP, the corresponding VR video will be saved to my phone. It takes up a lot of local memory. On the contrary, 5G is coming. The speed of downloading videos will be much faster. We can save the videos on the web server or cloud. When the user scan the QR code, the video player will download the corresponding video from the web server, which will also reduce the local memory occupied by the player.


### Reference:

* Google VR SDK for IOS:

https://developers.google.com/vr/ios


* QR code:

https://github.com/sbhklr/QRCodeEncoder
https://www.appcoda.com/qr-code-ios-programming-tutorial/


## Authors

* **Weida Jiang**



## Acknowledgments

* Google VR SDK for IOS
* IOS development
* etc
