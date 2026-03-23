Feature: DELETE user account

Scenario: DELETE user account
  * def created = call read('createUser.feature@create_user')
  Given url 'https://automationexercise.com/api/deleteAccount'
  And form fields { email: '#(created.user_email)', password: '123456' }
  When method delete
  Then status 200
  And match response.responseCode == 200
  And match response.message == 'Account deleted!'