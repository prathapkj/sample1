pipeline
{
    agent any
    environment
    {
        PATH="/home/ubuntu/apache-maven-3.8.1/bin:$PATH"
    }
    stages
    {
        stage('SCM Checkouts')
        {
            steps
            {
                git credentialsId: 'github', url: 'https://github.com/badrinathk04/test.git'
            }
            
        }
        stage('MVN build package')
        {
            steps
            {
                sh 'mvn clean install'
            }
        }
        stage('Bulid docker image')
        {
            steps
            {
                sh 'sudo docker build -t 9743625/badri:2.0 .'    
            }
        }
        stage('Push docker image')
        {
            steps
            {
                sh 'cat ~/my_pswd.txt|docker login --username 9743625 --password-stdin'
                sh 'docker push 9743625/badri:2.0'    
            }    
        }
        stage('Run container and deploy')
        {
            steps
            {
                //def dockerrun = 'docker run -d -p 8085:8080 --name my-deploy 9743625/badri:2.0'
                sshagent(['dev-ubuntu']) 
                {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.32.193 sudo docker run -d -p 8085:8080 9743625/badri:2.0"
                }
                   
            } 
        }
    }
}
