Feature: Search for affordable romance books
  As a user
  I want to search for a romance book priced under ₹1000
  So I can find affordable options within my preferred genre

  Background:
    Given the system supports the following Messages to inform the user
      | Message                                                     | Code  |
      | There's no available book for the current search filters    | MSG01 |
      | Unfortunately, system encountered an error loading the data | ERR01 |
      | Invalid price filter                                        | ERR02 |

  @positive @smoke @sanity
  Scenario: User searches for romance books priced under ₹1000, and there are matching books
    Given the system holds the following books in the "Romance" category with the following names and prices
      | book_name                     | price |
      | Harry Potter and the Prisoner | 213   |
      | The Hookup                    | 434   |
      | Birthday Girl                 | 441   |
      | Red Rising                    | 512   |
      | Before We Were Yours          | 123   |
      | All the Light We Cannot See   | 542   |
      | A Court of Mist and Fury      | 645   |
      | Fix Her Up                    | 3333  |
      | Like a Love Story             | 6666  |
      | The Beholder                  | 3333  |
    When the user requests to get the list of books with the following filters
      | genre   | price |
      | Romance | 1000  |
    Then the system returns the following list
      | book_name                     | price |
      | Before We Were Yours          | 123   |
      | Harry Potter and the Prisoner | 213   |
      | The Hookup                    | 434   |
      | Birthday Girl                 | 441   |
      | Red Rising                    | 512   |
      | All the Light We Cannot See   | 542   |
      | A Court of Mist and Fury      | 645   |

#  @positive
#  Scenario: User searches for romance books priced under ₹1000, but there are no matching books
#    Given the system holds the following books in the "Romance" category with the following names and prices
#      | book_name         | price |
#      | Fix Her Up        | 3333  |
#      | Like a Love Story | 6666  |
#      | The Beholder      | 3333  |
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    Then the system displays the message "There's no available book for the current search filters"
##
#  @positive @sanity
#  Scenario: User searches for romance books priced under ₹1000, and there are more than 10 matching books
#    Given the system holds more than 10 books in the "Romance" category priced under ₹1000, as listed in "romance_books_under_1000.csv"
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    Then the system returns the first 10 books from the list
#    And the system provides an option for pagination to view more books
#
#  @negative
#  Scenario: User searches for romance books priced under ₹1000, but the price equals exactly ₹1000 (edge case)
#    Given the system holds the following books in the "Romance" category with the following names and prices
#      | book_name        | price |
#      | Exact Price Book | 1000  |
#      | Just Under       | 999   |
#      | Overpriced Love  | 1001  |
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    Then the system returns the following list
#      | book_name  | price |
#      | Just Under | 999   |
#
#  @positive
#  Scenario: User searches for romance books priced under ₹1000, but the system holds no romance books at all
#    Given the system holds no books in the "Romance" category
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    Then the system displays the message "There's no available book for the current search filters"
#
#  @negative
#  Scenario: User searches for romance books priced under ₹1000, but the price filter is negative (edge case)
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | -100    |
#      | genre       | Romance |
#    Then the system displays the message "Invalid price filter"
#
#  @negative
#  Scenario: User searches for romance books priced under ₹1000, but inputs a non-numeric price (edge case)
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | "cheap" |
#      | genre       | Romance |
#    Then the system displays the message "Invalid price filter"
#
#  @positive
#  Scenario: User searches for romance books priced under ₹1000, and books are priced at zero (edge case)
#    Given the system holds the following books in the "Romance" category with the following names and prices
#      | book_name         | price |
#      | Free Romance      | 0     |
#      | Love for Nothing  | 0     |
#      | Affordable Hearts | 500   |
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    Then the system returns the following list
#      | book_name         | price |
#      | Free Romance      | 0     |
#      | Love for Nothing  | 0     |
#      | Affordable Hearts | 500   |
#
#  @negative
#  Scenario: User searches for romance books priced under ₹1000, and the system encounters an error loading data
#    Given the system holds books in the "Romance" category
#    When the user requests to get the list of books with the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    And the system encounters an error loading the data
#    Then the system displays the message "Unfortunately, system encountered an error loading the data"
#
#  @positive @sanity
#  Scenario: User clears all filters and the system updates the list automatically
#    Given the user has applied the following filters
#      | filter_type | value   |
#      | price       | 1000    |
#      | genre       | Romance |
#    And the system displays the filtered list of books
#      | book_name                        | price |
#      | Before We Were Yours             | 123   |
#      | Harry Potter and the Prisoner... | 213   |
#    When the user clears all filters
#    Then the system updates the list automatically to display all available books
#
#  @positive @sanity
#  Scenario: User sets a new filter and the system updates the list automatically
#    Given the user is viewing the list of all available books
#    When the user sets a new filter with the following criteria
#      | filter_type | value   |
#      | price       | 500     |
#      | genre       | Mystery |
#    Then the system updates the list automatically to display books matching the new filters
