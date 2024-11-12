# Test Automation for Book Card

This project leverages Gherkin scenarios transformed into runnable Cypress scripts using the power of the [`cypress-cucumber-preprocessor`](https://github.com/badeball/cypress-cucumber-preprocessor). The tests are written in a way that is understandable by Product Managers (PM), Product Owners (PO), the Development Team, and other QA members.

## Project Structure

- **`features/`**: Holds the feature files describing the scenarios in Gherkin language.
- **`support/pages/`**: Contains the definitions of the selectors of the elements following the Page Object Model (POM) pattern.
- **`support/step_definitions/`**: Houses the definitions of the steps that are referenced in the feature files.

## Prerequisites

### Option 1: Local Setup

- **Node.js**: You need to have Node.js installed on your machine.
    - [Download Node.js](https://nodejs.org/en/download/) and follow the installation instructions for your operating system.

### Option 2: Docker Setup

- **Docker**: If you prefer not to install Node.js, you can run the tests using Docker.
    - [Get Docker](https://www.docker.com/get-started) and install it on your machine.

## Running the Tests Locally

1. **Install Dependencies**

   Open a terminal in the project directory and run:

   ```bash
   npm install
   ```

2. **Execute Tests**

    - To open the Cypress Test Runner (interactive mode):

      ```bash
      npm run cy:open
      ```

    - To run the tests in headless mode:

      ```bash
      npm run cy:run
      ```

## Running the Tests with Docker

1. **Build the Docker Image**

   Replace `<your_image_name>` with your preferred image name:

   ```bash
   docker build -t <your_image_name> .
   ```

2. **Run the Docker Container**

   ```bash
   docker run <your_image_name>
   ```

   This will execute the tests inside the Docker container.

## Notes

- **No Environment Variables Needed**: This project does not require any environment variables to run.
- **Understanding Gherkin**: The feature files are written in Gherkin language, making them readable and understandable across different team roles.

## Helpful Links

- [Cypress Documentation](https://docs.cypress.io/)
- [Cypress Cucumber Preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor)
- [Node.js Download](https://nodejs.org/en/download/)
- [Docker Getting Started](https://www.docker.com/get-started)

---

Feel free to reach out if you have any questions or need further assistance!

Happy Testing!