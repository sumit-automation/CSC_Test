*** Settings ***
Resource         ../Keywords/Test_Keywords.robot
Variables        ../WebObjects/locators.py
Library         SeleniumLibrary

*** Test Cases ***
Search repository in Github
    [Tags]      Test1
    Given User opens Github website
    And User searches for "react" in Search field
    And User clicks on Advanced Search
    And User sets "JavaScript" in Written in this language
    And User sets ">45" in With this many stars
    And User sets ">50" in With this many followers
    And User sets "Boost Software License 1.0" in With this license
    When User Clicks on Search button
    Then page should contain     1 repository result
    And Validate repo "mvoloskov/decider" in search result list
    And User clicks on repo "mvoloskov/decider" in search result list
    And Print Readme content from repo

