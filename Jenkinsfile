node('maven') {

    slackSend channel: 'monolith', color: 'good', message: "Good ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"

    stage ("Get Source code"){
    
        slackSend channel: 'monolith', color: 'warning', message: "Warning ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"

    }
    
    }
