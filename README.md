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

* For many freshmen, they haven’t been to BMCC and don’t know how to get there or they don’t know         where Admission Office, Financial Office, or Academic Advisement and Transfer Center is.

Make some videos showing how to get from the subway station to Fiterman, Murray, or Main Building, or showing where some of the BMCC departments are.

* Virtual Course Introduction:

* Many students don‘t know how to choose a course. We can make some short course introduction videos (if necessary, the professors can show some 3D models, such as physics class, showing some equipment for physics experiments). This will be a good way to attract students.




### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Xcode](https://visualstudio.microsoft.com/) - Development environment C++

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

I use Github for versioning. 

## Authors

* **Weida Jiang**

## License

The MIT License

Copyright (c) [2010-2019] [weidajiang]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


## Acknowledgments

* Google VR SDK for IOS
* IOS development
* etc
