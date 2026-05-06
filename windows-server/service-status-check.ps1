<#
.SYNOPSIS
    Windows Server üzerinde önemli servislerin durumunu kontrol eder.

.DESCRIPTION
    Bu script, sistem yöneticilerinin Windows Server üzerinde kritik servislerin
    çalışıp çalışmadığını hızlıca kontrol etmesi için hazırlanmıştır.
    IIS, DNS, DHCP, Print Spooler ve Windows Update gibi servisler örnek olarak eklenmiştir.

.NOTES
    Gerçek kurum adı, sunucu adı veya IP bilgisi içermez.
    PowerShell yönetici olarak çalıştırılması önerilir.
#>

$ServicesToCheck = @(
    "W3SVC",        # IIS Web Server
    "DNS",          # DNS Server
    "DHCPServer",   # DHCP Server
    "Spooler",      # Print Spooler
    "wuauserv"      # Windows Update
)

Write-Host "Windows Server servis durumu kontrol ediliyor..." -ForegroundColor Cyan

$ServiceReport = foreach ($ServiceName in $ServicesToCheck) {

    $Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    if ($Service) {

        [PSCustomObject]@{
            ServiceName = $Service.Name
            DisplayName = $Service.DisplayName
            Status      = $Service.Status
            StartType   = $Service.StartType
        }

    }
    else {

        [PSCustomObject]@{
            ServiceName = $ServiceName
            DisplayName = "Servis bulunamadı"
            Status      = "NotFound"
            StartType   = "Unknown"
        }

    }
}

$ServiceReport | Format-Table -AutoSize
