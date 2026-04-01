Feature: Create new user account

  Background:
    * configure url = baseUrl
    * def utils = call read('classpath:common/common-utils.feature')
    * def email_factory = function(){ return 'matiasregalo64+' + utils.uuid() + '@gmail.com' }
    * def test_email = callonce email_factory

  @create_user
  Scenario: POST create user account
    * copy create_user_request = read('classpath:data/users/create-user.json')
    * set create_user_request.email = test_email

    Given path '/api/createAccount'
    And form fields create_user_request
    When method post
    Then status 200
    And match response.responseCode == 201
    And match response.message == 'User created!'
    * def user_email = test_email
