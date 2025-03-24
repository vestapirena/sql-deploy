pipeline {
    agent any

    environment {
        MYSQL_USER = 'root'
        MYSQL_PASS = 'root' 
        MYSQL_DB_DEV = 'sql_deploy_dev'
        MYSQL_DB_UAT = 'sql_deploy_dev' 
        MYSQL_CLIENT = '"C:/Program Files/MariaDB 11.5/bin/mysql.exe"'
    }

    parameters {
        booleanParam(name: 'DO_ROLLBACK', defaultValue: false, description: 'Run rollback scripts instead of install scripts?')
    }

    stages {
        stage('Run SQL Scripts') {
            steps {
                script {
                    def sseFile = params.DO_ROLLBACK ? 'pipeline/STD_INT_ALT_rollback.sse' : 'pipeline/STD_INT_ALT_ALL.sse'
                    def sse = readFile(sseFile).split("\n")

                    sse.each { file ->
                        sh """
                        ${MYSQL_CLIENT} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB_DEV} < ${file.trim()}
                        """
                    """
                }
            }
        }
    }
}
