// Preparation for all your tests can happen here
//I needed to include jsdon-global to prevent the following error when running tests:
// Error: [vue-test-utils]: window is undefined, vue-test-utils needs to be run in a browser environment.
// You can run the tests in node using jsdom + jsdom-global.


// npm i jsdom jsdom-global --save-dev

//To get async await working in babel follow solution 3 here: https://exerror.com/babel-referenceerror-regeneratorruntime-is-not-defined/

require('jsdom-global')()
