Feature: Create new user account

  Background:
    * url 'https://automationexercise.com'
    * def email_factory = function(){ return 'matiasregalo64+' + java.util.UUID.randomUUID() + '@gmail.com' }
    * def test_email = callonce email_factory

    @create_user
  Scenario: POST create user account
    * def create_user_request =
  """
  {
    "name": "Matias Regalo",
    "email": "#(test_email)",
    "password": "123456",
    "title": "Mr",
    "birth_date": "6",
    "birth_month": "April",
    "birth_year": "2006",
    "firstname": "Matias",
    "lastname": "Regalo",
    "company": "Sofka.",
    "address1": "Salto 919",
    "address2": "Brandsen 2162",
    "country": "Uruguay",
    "zipcode": "12345",
    "state": "Montevideo",
    "city": "Montevideo",
    "mobile_number": "094390927"
  }
  """

    Given path '/api/createAccount'
    And form fields create_user_request
    When method post
    Then status 200
    And match response.responseCode == 201
    And match response.message == 'User created!'
    * def user_email = test_email
