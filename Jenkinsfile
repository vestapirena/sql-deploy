pipeline {
    agent any

    environment {
        MYSQL_USER = 'root'
        MYSQL_PASS = 'root'
        MYSQL_CLIENT = '"C:/Program Files/MariaDB 11.5/bin/mysql.exe"'
        MYSQL_DB_DEV = 'sql_deploy_dev'
        MYSQL_DB_UAT = 'sql_deploy_uat'
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
                        file = file.trim()
                        if (!file) return // skip empty lines

                        def db = file.contains("UAT") ? MYSQL_DB_UAT : MYSQL_DB_DEV

                        sh """
                        ${MYSQL_CLIENT} -u ${MYSQL_USER} -p${MYSQL_PASS} ${db} < ${file}
                        """
                    }
                }
            }
        }
    }
}
