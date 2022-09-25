# CP ALL TIME
## [Configuration Overview]
Installation Library as follow belows:
- SeleniumLibrary (https://pypi.org/project/robotframework-seleniumlibrary/)
```sh
pip install robotframework-seleniumlibrary
```
- CSVLibrary (https://pypi.org/project/robotframework-csvlibrary-py3/)
```sh
pip install robotframework-csvlibrary-py3
```
- ScreenCapLibrary (https://pypi.org/project/robotframework-screencaplibrary/)
```sh
pip install robotframework-screencaplibrary
```
- PyYAML (https://pypi.org/project/PyYAML/)
```sh
pip install PyYAML
```
&nbsp;
### [Variables name]
Page object locator is starts with element type in 3 characters
- ***txt*** is text box
- ***chk*** is check box
- ***rdo*** is radio select
- ***slc*** is select box
- ***lbl*** is text label
- ***btn*** is button
&nbsp;
### [Command Line to run testcases]
Variable to execute test case
- ***env*** is environment to run (uat)
- ***headless*** is open chrome browser with headless (Default: false)
- ***record*** is record screen when test case run (Default: false)
&nbsp;
**Example**
```sh
robot -d Results -v env:uat ./testcase_01.robot
```