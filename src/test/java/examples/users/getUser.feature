Feature: Get user account detail by email

  Scenario: GET user account detail by email
    * def created = call read('createUser.feature@create_user')
    Given url 'https://automationexercise.com/api/getUserDetailByEmail'
    And param email = created.user_email
    When method get
    Then status 200
    And match response.responseCode == 200
    And match response.user.email == created.user_email
    And match response.user.first_name == 'Matias'
