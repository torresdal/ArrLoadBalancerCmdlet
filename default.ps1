properties {
	$pwd = Split-Path $psake.build_script_file	
	$build_directory  = "$pwd\Build"
	$solution_name = "ArrLoadBalancerCmdlet"
	$solution_file = "$solution_name.sln"
	$tools_directory  = "$pwd\tools\"
	$version          = "1.0.0.0"
	$configuration = "Debug"
}
 
include .\tools\psake_ext.ps1
 
task default -depends Build
task ci -depends Build

task Build -depends Clean, Init { 
	Exec { msbuild "$solution_file" /t:Build /p:Configuration=$configuration /p:OutDir=$build_directory\ }
}

task Init {  
	$nugetVersion = $version.Substring(0, $version.LastIndexOf("."))
	Generate-Nuspec-File `
		-file "$build_directory\$solution_name.nuspec" `
		-version $nugetVersion `
		-pre_release $true `
		-id "$solution_name" `
		-title "$solution_name" `
		-licenseUrl "http://blog.torresdal.net" `
		-projectUrl "http://blog.torresdal.net" `
		-description "Some description" `
		-iconUrl "http://blog.torresdal.net" `
		-releaseNotes "" `
		-tags "PowerShell ApplicationRequestRouting ARR" `
		-files @(@{ Path="*.dll"; Target="lib/net20/ArrLoadBalancer"}, @{ Path="*.ps*"; Target="lib/net20/ArrLoadBalancer"} )       
		#-dependencies @(@{ Name="nuget"; Version="1.0.0"}, @{ Name="condep"; Version="2.0.0"} ) `

#    Generate-Assembly-Info `
#        -file "$pwd\AssemblyVersionInfo.cs" `
#        -company "ConDep" `
#        -product "ConDep $version" `
#        -copyright "Copyright © ConDep 2012" `
#        -version $version `
#        -clsCompliant "true"
#        
#    if ((Test-Path $build_directory) -eq $false) {
#        New-Item $build_directory -ItemType Directory
#    }
}
 
task Clean {
	Write-Host "Cleaning Build output"  -ForegroundColor Green
	Remove-Item $build_directory -Force -Recurse -ErrorAction SilentlyContinue
}
