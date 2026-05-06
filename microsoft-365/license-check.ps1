<#
.SYNOPSIS
    Microsoft 365 kullanıcı lisanslarını kontrol eder.

.DESCRIPTION
    Bu script, Microsoft Graph PowerShell modülü kullanarak tenant üzerindeki kullanıcıların
    lisans durumlarını listelemek için hazırlanmıştır. Sistem yöneticileri tarafından
    lisans takibi, kullanıcı kontrolü ve raporlama süreçlerinde kullanılabilir.

.NOTES
    Gerçek tenant, domain veya kişisel veri içermez.
    Çalıştırmak için Microsoft Graph PowerShell modülü gereklidir.
#>

# Gerekli modül yoksa yüklenmelidir:
# Install-Module Microsoft.Graph -Scope CurrentUser

Import-Module Microsoft.Graph.Users

Write-Host "Microsoft Graph bağlantısı başlatılıyor..." -ForegroundColor Cyan

Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All"

Write-Host "Kullanıcı lisans bilgileri alınıyor..." -ForegroundColor Cyan

$Users = Get-MgUser -All -Property DisplayName, UserPrincipalName, AssignedLicenses |
    Select-Object DisplayName, UserPrincipalName,
    @{Name = "LicenseCount"; Expression = { $_.AssignedLicenses.Count } },
    @{Name = "Licensed"; Expression = { if ($_.AssignedLicenses.Count -gt 0) { "Yes" } else { "No" } } }

$Users | Format-Table -AutoSize

# İstenirse CSV olarak dışa aktarılabilir:
# $Users | Export-Csv -Path ".\m365-license-report.csv" -NoTypeInformation -Encoding UTF8

Disconnect-MgGraph
