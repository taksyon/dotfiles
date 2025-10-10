local root = vim.fs.root(0, { '.project', 'pom.xml', 'build.gradle', 'settings.gradle', 'gradlew', 'mvnw', '.git' })
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace = vim.fn.stdpath('data') .. '/jdtls-workspaces/' .. project_name
local config = {
	cmd = {
		'java', -- or '/path/to/java21_or_newer/bin/java'

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=false',
		'-Dlog.level=WARNING',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar',
		'/home/tak/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1300.v20241223-1657.jar',
		'-configuration', 'home/tak/.local/share/nvim/mason/packages/jdtls/config_linux',
		'-data', workspace,
	},

	root_dir = root,
	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			project = {
				sourcePaths = { 'src', },
			}
		}
	},

	-- Language server `initializationOptions`
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	init_options = {
		bundles = {}
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
