'use strict';

const fs = require('fs');
const npmRun = require('npm-run');

function lintDockerfiles(dir) {
    if (dir.includes('node_modules') || dir.includes('.git')) {
        return;
    }

    let files = fs.readdirSync(dir);

    for (let i in files) {
        let name = dir + '/' + files[i];

        if (fs.statSync(name).isDirectory()) {
            lintDockerfiles(name);
        } else {
            if (files[i] === 'Dockerfile') {
                npmRun.exec('dockerfile_lint -f ' + name + ' -r ./dockerfilelint_rules.yml', {cwd: __dirname}, (err, stdout, stderr) => {
                    if (err && err.length) {
                        console.error(err);
                    }

                    if (stderr && stderr.length) {
                        console.error(stderr);
                    }

                    if (stdout && stdout.length) {
                        if (!stdout.includes('Check passed!')) {
                            console.error(stdout);
                            return false;
                        } else {
                            console.log(stdout);
                        }
                    }
                })
            }
        }
    }

    return true;
}

lintDockerfiles('.');