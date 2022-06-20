# Repositories

<img src="https://i.imgur.com/UPuPPVE.png" width="60" align=middle>

# Contents

* [Goal](#Goal)
* [Instructions](#Instructions)
* [Screens](#Screens)
* [Requirements](#Requirements)
* [Design](#Design)
* [Bonus Points](#Bonus-Points)
* [Notes](#Notes)

## Goal
Write an application to find repositories in GitHub.

## Instructions
The application is ready to be used after downloading.

## Screens
 The application must include the following screens:
 
- Authorization screen in GitHub. Two-factor authentication is not enabled.
- Screen with search field and list of found repositories. You need to display an "infinite" feed of search results: the name of the repository, its short description, the main language, the number of stars, and, if available, the first image from the README file.
- Detailed view of information about the repository. Any interesting information.

## Requirements
- The project must be put into a repository on GitHub.
- The project should compile and run. Assembly instructions are described in the README.
- Use the Texture framework for layout
- DO NOT use XIB / Storyboard
- DO NOT use Alamofire / AFNetworking / Moya
- Minimum iOS version - 13

## Design

### _Search Result List_

* Avatar of Repository Owner
* Repository Name
* Repository Description
* Repository Language
* Number of stars (watchers)

<img src="https://i.imgur.com/lRBuimQ.png" width="250" align=middle style="border:1px dashed red;" > <img src="https://i.imgur.com/0XUnyHZ.png" width="250" align=middle style="border:1px dashed red;" >

<br>

### _Detail Screen_

* The same header as the results list.
* Other information is contained in the scroll view.
* Rendered markdown file from repository's README file.

<img src="https://i.imgur.com/ZOaTHCM.png" width="250" align=middle style="border:1px dashed red;" >

<br>

### _Authentication Screen_

* If the user has not yet authenticated, then the login screen will be presented.
* If the authentication is successful, the credentials screen will present.
* A button for logging out.

<img src="https://i.imgur.com/XCfNyG7.png" width="250" align=middle style="border:1px dashed red;" > <img src="https://i.imgur.com/k7QO94P.png" width="250" align=middle style="border:1px dashed red;" >


## Bonus Points

- Asynchronous loading of search results.
- Offline mode (search results should be cached - CoreData / UserDefaults / SQLite ).
- Rendering the README file on the screen with information about the repository.
- Handling authorization errors

## Notes
Unfortunately, I wasn't able to find a way to render the markdown-formatted README file natively. Since it is nonmandatory on the project, I have used a custom package called MarkdownView.

On the tests I have done on several devices and versions, the view sometimes isn't working properly on iOS 13. So, if possible, use iOS 14.5 and later.
