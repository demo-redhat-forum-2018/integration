#!groovy
/*
 * This pipeline accepts the following parameters :
 *  - OPENSHIFT_IMAGE_STREAM: The ImageStream name to use to tag the built images
 *  - OPENSHIFT_BUILD_CONFIG: The BuildConfig name to use
 *  - OPENSHIFT_SERVICE: The Service object to update (either green or blue)
 *  - OPENSHIFT_DEPLOYMENT_CONFIG: The DeploymentConfig name to use
 *  - OPENSHIFT_BUILD_PROJECT: The OpenShift project in which builds are run
 *  - OPENSHIFT_TEST_ENVIRONMENT: The OpenShift project in which we will deploy the test version
 *  - OPENSHIFT_PROD_ENVIRONMENT: The OpenShift project in which we will deploy the prod version
 *  - NEXUS_REPO_URL: The URL of your Nexus repository. Something like http://<nexushostname>/repository/maven-snapshots/
 *  - NEXUS_MIRROR_URL: The URL of your Nexus public mirror. Something like http://<nexushostname>/repository/maven-all-public/
 *  - NEXUS_USER: A nexus user allowed to push your software. Usually 'admin'.
 *  - NEXUS_PASSWORD: The password of the nexus user. Usually 'admin123'.
 *  - OVH_URL
 *  - OVH_TOKEN
 *  - AZURE_URL
 *  - AZURE_TOKEN
 *  - QUAY_REGISTRY
 *  - QUAY_USER
 *  - QUAY_PASSWORD
 */



node('maven') {
    
    def newVersion
    def azureURL = env.AZURE_URL
    def azureToken = env.AZURE_TOKEN
    def ovhURL = "${env.OVH_URL}"
    def ovhToken = env.OVH_TOKEN
    def openShiftTestEnv = env.OPENSHIFT_TEST_ENVIRONMENT
    def openShiftProdEnv = env.OPENSHIFT_PROD_ENVIRONMENT
    
   

    echo "App route ${appRoute}"

    slackSend channel: 'monolith', color: 'good', message: " --- Pipeline Starting --- on ${env.OVH_URL} \n Job name : ${env.JOB_NAME} \nBuild number : ${env.BUILD_NUMBER} \nCheck <${env.RUN_DISPLAY_URL}|Build logs>\n ---"

    stage ("Deploy to test"){
    
    def appRouteTest =  sh(script: 'oc get route coolstore  --template=\'{{ .spec.host }}\' -n ${params.OPENSHIFT_TEST_ENVIRONMENT}', returnStdout: true)
   appRouteTest = "https://${appRoute}"
        slackSend channel: 'monolith', color: 'good', message: "--- Test Application Deployed --- \n OCP Cluster target : ${env.AZURE_URL}\n Namespace: ${params.OPENSHIFT_TEST_ENVIRONMENT} \n Access <${appRouteTest}|App> \n ---"

    }

    stage ("Deploy to Prod / Switch New version"){
    
    def appRoute =  sh(script: 'oc get route coolstore  --template=\'{{ .spec.host }}\' -n ${params.OPENSHIFT_PROD_ENVIRONMENT}', returnStdout: true)
   appRoute = "https://${appRoute}"
        slackSend channel: 'monolith', color: 'good', message: "--- Production Application Deployed --- \n OCP Cluster target : ${env.OVH_URL}\n Namespace: ${params.OPENSHIFT_PROD_ENVIRONMENT} \n Access <${appRoute}|App> \n ---"

    }
    
    }
