# docker_jenkins_LAMP

A Three Part Process

The CI workflow described in this article is composed of three steps. The developer first pushes a commit to GitHub, 
which in turn uses a webhook to notify Jenkins of the update. Jenkins can then pull the GitHub repository, build the Docker container 
which contains our stack and then run the test. If the test passes, Jenkins will push the code to the master branch.

https://www.stratoscale.com/blog/devops/practical-devops-use-case-github-jenkins-docker/   
