# Pomelo iOS Challenge

Welcome to the Pomelo iOS challenge!

## Principles & Ground Rules

Please focus on those four principles while writing code: **clarity**, **simplicity**, **defensiveness** and  **resilience**.

- **Clarity**: write clear code that any developer can read and understand in one go.

- **Simplicity**: write gimmick-free and straightforward code with no ambiguities.

- **Defensiveness**: cover edge cases and treat user inputs with care.

- **Resilience**: gracefully handling an error and unexpected behaviour.


* We prefer well-thought-out solutions over the quick-and-dirty kind. So take your time, if you need it. A swift rejection usually matches a rushed job.
* Submission is made via a zip archive of your git-based project. 
* Send your submission to [coding-challenge@pomelofashion.com](mailto:coding-challenge@pomelofashion.com?subject=iOS-coding-challenge)

## Testing your implementation

Note that we require you to add full test coverage and that all tests pass before we can invite you in for an interview.

In test mode, no network connection is made to 3rd party servers.

## Evaluation Criteria
1. Functionality: the app works as expected, no crashes.
2. Code quality: architecture, design patterns, coding conventions, etc.
3. Speed: candidate has 2 days to develop the app
4. We will evaluate process and achievement even if it’s not 100% finished

## Requirements
1. UI doesn’t need to match 100% the screenshot
2. Test is required
3. Any third party libraries are allowed

## The assignment

### Instructions

Write a simple app with the following features:
1. The app should contain one screen
2. Display a list of pickup locations with name, city and address (use the following fields from API pickup.alias, pickup.address1, pickup.city)
3. Get the list of pickup locations from the API endpoint (filter by `active=true`)
4. Add a button to the toolbar. Clicking the button should request for location permission and get the current user location.
5. Sort locations by distance to the user location and show distance with `x.x` km, closest location first, when the current location is available

### API endpoist
#### URL
https://45434c1b-1e22-4af2-8c9f-c2d99ffa4896.mock.pstmn.io/v3/pickup-locations

#### Header
```javascript
content-type: application/json
x-api-key: <TBD>
```


### Guidelines

- Don't forget documentation (inline, README, etc).
