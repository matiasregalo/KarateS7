@parallel=false
Feature: Users

Background:
  * url 'https://automationexercise.com'
  * def email_factory = function(){ return 'matiasregalo64+' + java.util.UUID.randomUUID() + '@gmail.com' }
  * def test_email = callonce email_factory
  * def test_password = '123456'

Scenario: POST create user account
  * def create_user_request =
  """
  {
    "name": "Matias Regalo",
    "email": "#(test_email)",
    "password": "#(test_password)",
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

Scenario: GET user account detail by email
  Given path '/api/getUserDetailByEmail'
  And param email = test_email
  When method get
  Then status 200
  And match response.responseCode == 200
  And match response.user.email == test_email
  And match response.user.first_name == 'Matias'

Scenario: PUT update user account
  * def update_user_request =
  """
  {
    "name": "Matias Regalo Updated",
    "email": "#(test_email)",
    "password": "#(test_password)",
    "title": "Mr",
    "birth_date": "6",
    "birth_month": "April",
    "birth_year": "2006",
    "firstname": "Matias",
    "lastname": "Regalo",
    "company": "Sofka Updated",
    "address1": "Salto 919",
    "address2": "Brandsen 2162",
    "country": "Uruguay",
    "zipcode": "12345",
    "state": "Montevideo",
    "city": "Montevideo",
    "mobile_number": "094390927"
  }
  """

  Given path '/api/updateAccount'
  And form fields update_user_request
  When method put
  Then status 200
  And match response.responseCode == 200
  And match response.message == 'User updated!'

Scenario: DELETE user account
  Given path '/api/deleteAccount'
  And form fields { email: '#(test_email)', password: '#(test_password)' }
  When method delete
  Then status 200
  And match response.responseCode == 200
  And match response.message == 'Account deleted!'