local config = {
    cmd = {'/home/chitreshnarra/Downloads/jdtls/bin/jdtls'},
    root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
}
require('jdtls').start_or_attach(config)
