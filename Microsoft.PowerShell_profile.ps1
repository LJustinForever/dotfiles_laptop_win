
Import-Module posh-git
Invoke-Expression (& { (zoxide init powershell | Out-String) })

$timsProjects = "--project .\Development\TIMS\TIMS.Server.Migrations\ --startup-project .\Development\TIMS\Server\"

function dblist {
    Invoke-Expression "dotnet ef migrations list $timsProjects"
}

function dbremove {
    Invoke-Expression "dotnet ef migrations remove $timsProjects"
}

function dbupdate {
    param([string]$migration = "")
    if ($migration) {
        Invoke-Expression "dotnet ef database update $migration $timsProjects"
    } else {
        Invoke-Expression "dotnet ef database update $timsProjects"
    }
}

function dbadd {
    param([Parameter(Mandatory)][string]$name)
    Invoke-Expression "dotnet ef migrations add $name $timsProjects"
}

