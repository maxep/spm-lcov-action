const core = require('@actions/core')
const exec = require('@actions/exec')

async function main() {
    const format = core.getInput('file-format')
    const output = core.getInput('output-file')
    await exec.exec(`${__dirname}/cov.sh -f ${format} -o ${output}`)
}

main().catch(err => core.setFailed(err.message))