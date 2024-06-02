Step 3: Setup Jenkins
Install Jenkins and Necessary Plugins:

Install Jenkins on your server.
Go to Manage Jenkins -> Manage Plugins and install:
Docker Plugin
Selenium Plugin
Pipeline Plugin
Warnings Next Generation Plugin (for Docker image scanning)
Configure Jenkins Job:

Create a new item in Jenkins, select Pipeline, and name it Selenium-Demo.
In the pipeline configuration, set the pipeline script to use the Jenkinsfile from your repository.
Step 4: Run the Pipeline
Run the Pipeline:
Go to your Jenkins project and click Build Now.
Monitor the console output for the stages: Checkout, Build, Docker Build, Docker Scan, and Test.