/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  globals:{ // the regular 'tsconfig.json' file have no reson to compile test files.
    "ts-jest":{
      tsconfig: 'tsconfig.spec.json'
    }
  }
};