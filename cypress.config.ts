import { defineConfig } from "cypress";
import * as createBundler from "@bahmutov/cypress-esbuild-preprocessor";
import { addCucumberPreprocessorPlugin } from "@badeball/cypress-cucumber-preprocessor";
// @ts-ignore
import { createEsbuildPlugin } from "@badeball/cypress-cucumber-preprocessor/esbuild";
import * as fs from 'fs';

async function setupNodeEvents(
    on: Cypress.PluginEvents,
    config: Cypress.PluginConfigOptions
): Promise<Cypress.PluginConfigOptions> {
  // This is required for the preprocessor to be able to generate JSON reports after each run, and more,
  await addCucumberPreprocessorPlugin(on, config);

  on(
      "file:preprocessor",
      createBundler({
        plugins: [createEsbuildPlugin(config)],
      })
  );


  // Make sure to return the config object as it might have been modified by the plugin.
  return config;
}

export default defineConfig({
  watchForFileChanges: true,
  defaultCommandTimeout: 20000,
  e2e: {
    retries: {
      runMode: 2,
      openMode: 2
    },
    video: true,
    reporter: 'junit',
    reporterOptions: {
      mochaFile: 'reports/my-test-output-[hash].xml',
    },
    viewportWidth: 1920,
    viewportHeight: 1080,
    specPattern: "**/*.feature",
    baseUrl: "https://bookcart.azurewebsites.net/",
    setupNodeEvents,
  },
});
