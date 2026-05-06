<#
.SYNOPSIS
    Active Directory üzerinde devre dışı bırakılmış kullanıcı hesaplarını listeler.

.DESCRIPTION
    Bu script, domain ortamında devre dışı bırakılmış kullanıcı hesaplarını raporlamak için kullanılır.
    Günlük kontrol, hesap temizliği ve kullanıcı yaşam döngüsü yönetimi süreçlerinde kullanılabilir.

.NOTES
    Gerçek kurum adı, domain veya kişisel veri içermez.
    Çalıştırmak için ActiveDirectory PowerShell modülü gereklidir.
#>

Import-Module ActiveDirectory

Write-Host "Active Directory üzerinde devre dışı kullanıcılar kontrol ediliyor..." -ForegroundColor Cyan

$DisabledUsers = Get-ADUser -Filter 'Enabled -eq $false' -Properties LastLogonDate, Department |
    Select-Object Name, SamAccountName, Enabled, Department, LastLogonDate

if ($DisabledUsers) {
    $DisabledUsers | Format-Table -AutoSize
}
else {
    Write-Host "Devre dışı kullanıcı hesabı bulunamadı." -ForegroundColor Green
}
