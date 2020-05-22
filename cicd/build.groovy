@Library("jenlib@master") _
// ===== /SHARED PART ====

//// approval for currentScriptPath
// field org.jenkinsci.plugins.workflow.multibranch.SCMBinder scriptPath
// method hudson.model.Run getParent
// method java.io.File getParent
// method org.jenkinsci.plugins.workflow.job.WorkflowJob getDefinition
// method org.jenkinsci.plugins.workflow.support.steps.build.RunWrapper getRawBuild
// new java.io.File java.lang.String

// --- globas vars ---
def jg = [
    scmvars: null,
    cmds: [],
    tstages: [:],
    prj_dir: '.',
    commits: [],
    params: [
        samle: 'yes'
    ],
    currentScriptPath: new File(currentBuild.rawBuild.parent.definition.scriptPath).parent
]

node() {timestamps {

    stage('fetch'){
        echo 'Fetch source'
        def scmvars = checkout scm
        def more = "repo_validate"
        jen.set_build_name(currentBuild, scmvars, more)
        jg['scmvars'] = scmvars
    }

    stage('commits'){
        jen.desc_from_commits(currentBuild, jg)
    }

    catchError { dir(jg['currentScriptPath']){
        jen.step_stages_from_tasks(
            jg, jg.prj_dir,
            'Taskfile.yml', 'ci-flow')
    }}

    stage('finish'){
        echo "done"
    }
}}
