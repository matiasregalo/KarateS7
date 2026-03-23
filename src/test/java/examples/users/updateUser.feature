Feature: Update user account

  Scenario: PUT update user account
    * def created = call read('createUser.feature@create_user')
    * def update_user_request =
  """
  {
    "name": "Matias Regalo Updated",
    "email": "#(created.user_email)",
    "password": "123456",
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
    Given url 'https://automationexercise.com/api/updateAccount'
    And form fields update_user_request
    When method put
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'User updated!'