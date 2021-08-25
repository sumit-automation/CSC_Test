*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}         https://github.com

*** Keywords ***
User opens Github website
    open browser        ${URL}      chrome
    maximize browser window

User enters text "${value}" in textfield "${UI_Elem}"
    scroll element into view       ${UI_Elem}
    input text      ${UI_Elem}      ${value}

User searches for "${value}" in Search field
    User enters text "react" in textfield "${edit_Search_Github}"
    press keys      ${edit_Search_Github}       ENTER
    wait until page contains element     ${txt_Repositories}
    scroll element into view        ${txt_Repositories}

User clicks on Advanced Search
    scroll element into view        ${link_Advanced_Search}
    click element       ${link_Advanced_Search}
    wait until page contains        Advanced options

User sets "${value}" in Written in this language
    scroll element into view    ${select_Language_filter}
    select from list by label    ${select_Language_filter}     ${value}

User sets "${value}" in With this many stars
    scroll element into view    ${edit_Stars_filter}
    User enters text "${value}" in textfield "${edit_Stars_filter}"

User sets "${value}" in With this many followers
    scroll element into view    ${edit_Followers_filter}
    User enters text "${value}" in textfield "${edit_Followers_filter}"

User sets "${value}" in With this license
    scroll element into view    ${select_License_filter}
    select from list by label    ${select_License_filter}     ${value}

User Clicks on Search button
    scroll element into view        ${btn_Search}
    click button       ${btn_Search}

Validate repo "${repo_name}" in search result list
    ${elem}=    get webelement     ${list_Repo_Search_Result}/li//a[text()='${repo_name}']
    Run keyword and continue on failure     page should contain element     ${elem}

User clicks on repo "${repo_name}" in search result list
    ${elem}=    get webelement     ${list_Repo_Search_Result}/li//a[text()='${repo_name}']
    scroll element into view        ${elem}
    click element       ${elem}

Print Readme content from repo
    wait until page contains element        ${div_Readme_content}
    ${screen_text}=     get text        ${div_Readme_content}
    Log   ${screen_text}[:300]

