$features = @(
"msmq-container",
"msmq-server",
"IIS-WebServerRole",
"IIS-WebServer",
"IIS-CommonHttpFeatures",
"IIS-HttpErrors",
"IIS-HttpRedirect",
"IIS-ApplicationDevelopment",
"IIS-Security",
"IIS-RequestFiltering",
"IIS-NetFxExtensibility",
"IIS-NetFxExtensibility45",
"IIS-HealthAndDiagnostics",
"IIS-HttpLogging",
"IIS-LoggingLibraries",
"IIS-RequestMonitor",
"IIS-HttpTracing",
"IIS-URLAuthorization",
"IIS-IPSecurity",
"IIS-Performance",
"IIS-WebServerManagementTools",
"IIS-ManagementScriptingTools",
"IIS-IIS6ManagementCompatibility",
"IIS-Metabase",
"IIS-HostableWebCore",
"IIS-StaticContent",
"IIS-DefaultDocument",
"IIS-DirectoryBrowsing",
"IIS-WebSockets",
"IIS-ISAPIExtensions",
"IIS-ISAPIFilter",
"IIS-ServerSideIncludes",
"IIS-CustomLogging",
"IIS-BasicAuthentication",
"IIS-HttpCompressionStatic",
"IIS-ManagementConsole",
"IIS-ManagementService",
"IIS-WMICompatibility",
"IIS-LegacyScripts",
"IIS-LegacySnapIn",
"IIS-CertProvider",
"IIS-WindowsAuthentication",
"IIS-DigestAuthentication",
"IIS-ClientCertificateMappingAuthentication",
"IIS-ASPNET45",
"IIS-IISCertificateMappingAuthentication"
)
$features | %{ 
#  get-windowsoptionalfeature -online -featurename $_ | enable-windowsoptionalfeature -online 
	get-windowsoptionalfeature -online -featurename $_ |
}