Feature: DELETE user account

  Background:
    # configure url persists across feature calls (unlike 'url' which resets)
    * configure url = baseUrl

  Scenario: DELETE user account
    * def created = call read('classpath:features/users/create-user.feature@create_user')
    Given path '/api/deleteAccount'
    And form fields { email: '#(created.user_email)', password: '123456' }
    When method delete
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'Account deleted!'