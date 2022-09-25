*** Settings ***
Library      ScreenCapLibrary
Library      OperatingSystem
Library      SeleniumLibrary
Library      CSVLibrary
Library      DateTime
Library      String
Resource     ../../keywords/web/common/common_keywords.robot
Resource     ../../resources/web/downloads/${ENV}/path.robot
Variables    ../../resources/web/configs/${ENV}/env_config.yaml
Variables    ../../resources/web/testdata/${ENV}/test_data.yaml