The goal of this project is to test the API https://api.tmsandbox.co.nz.

This project uses the programming language Python. The Robot Framework was chosen as the project framework. To use this project, it is necessary to set up your PC. Follow these steps:

Installation:
1. Install Python and don't forget to add the correct paths.
	- Open https://www.python.org/ and download the newest version for your PC and operating system.
2. Verify the installation.
	- Open CMD and type "python".
	- You should now see the version of Python which you installed.

3. Install Robot Framework and Libraries:
	- Open CMD.
	- Type the following commands one by one and wait until the installation is finished:
		- "pip install robotframework"
		- "pip install requests"
		- "pip install robotframework-requests"
		- "pip install robotframework-jsonlibrary"

4. Install the IDE Visual Studio Code:
	- Open https://code.visualstudio.com/ and download it.
	- Install VS Code on your PC.
	- Open VS Code and on the left menu find "Extensions" and open it.
	- Add these extensions:
		- "Robot Framework Language Server" (by Robocorp)
			- Enables working with Robot Framework scripting, including running/debugging directly from IDE.
			- Set in settings: Robot > Lint > Robocop to Enabled. Check syntax of code, including wrong spaces and lines.
			- Set in settings: Robot: Code Formatter = robotidy.
		- "Todo Tree" (by Gruntfuggly)
			- Enables use of todo items TODO/FIXME/BUG/HACK/[x].
		- "Python" (by Microsoft)
			- Enables working with Python scripts.

5. Download this project from GitHub:
	- https://github.com/vojtechbilik/Assurity.git


Running the test:
1. Open VS Code.
2. In VS Code, open the downloaded project "Assurity".
3. Open the terminal and type this command: "robot -d results tests/assurity.robot".
4. The automation test case will run.
5. You can find the outputs in the "report.html" file.


