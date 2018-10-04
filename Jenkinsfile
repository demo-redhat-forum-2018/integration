node('maven') {

    def appRoute = sh "oc get route jenkins  --template='{{ .spec.host }}'"
    echo "App route {$appRoute}"
    
    slackSend channel: 'monolith', color: 'good', message: "Le Build  ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${appRoute}|Open>)"

    stage ("Get Source code"){
    
        slackSend channel: 'monolith', color: 'warning', message: "Warning ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.RUN_DISPLAY_URL}|Open>)"

    }
    
    }
