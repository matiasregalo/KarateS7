Feature: Update user account

  Background:
    # configure url persists across feature calls (unlike 'url' which resets)
    * configure url = baseUrl

  Scenario: PUT update user account
    * def created = call read('classpath:features/users/create-user.feature@create_user')
    # karate.copy() prevents mutating the cached file data shared across scenarios
    * copy update_user_request = read('classpath:data/users/update-user.json')
    * set update_user_request.email = created.user_email
    Given path '/api/updateAccount'
    And form fields update_user_request
    When method put
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'User updated!'