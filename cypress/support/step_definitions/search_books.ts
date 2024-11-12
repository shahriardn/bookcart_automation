import {Then, When, Given} from "@badeball/cypress-cucumber-preprocessor";

import { serachPage } from "../pages/search_books"
const sp = new serachPage()
Given(/^the system supports the following Messages to inform the user$/, function () {
    cy.visit('/')
});
Given(/^the system holds the following books in the "([^"]*)" category with the following names and prices$/, function () {
    // Todo: inserting books into DB or using other methods. I don't implement it as system is not fully designed for QA automation purposes
});

When(/^the user requests to get the list of books with the following filters$/,
    function (dataTable: any) {
        const data = dataTable.rawTable.slice(1); // Remove the header row
        const filter_details = {
            genre: data[0][0],
            price: data[0][1]
        };
        cy.log(filter_details.genre)
        cy.log(filter_details.price)
        filter_details.genre && sp.elem_genre_filter().contains(filter_details.genre).click();

        sp.elem_price_filter().invoke('val', filter_details.price).trigger('input').trigger('change');

    });
Then(/^the system returns the following list$/,   function (dataTable) {
    const data = dataTable.rawTable.slice(1); // Remove the header row
    const expectedBookCount = data.length; // Count the number of books in the table

    // Assert that the number of books in the table matches the number of ".cards" on the page
    sp.elem_books_cards().should('have.length', expectedBookCount);

    // Iterate through each row in the dataTable
    data.forEach((row) => {
        const bookName = row[0];
        const price = row[1];

        // Check if a card exists with the book name and price
        sp.elem_books_cards().contains(bookName).should('exist');
        sp.elem_books_cards().contains(price).should('exist');
    });

});