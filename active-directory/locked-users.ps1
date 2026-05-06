<#
.SYNOPSIS
    Active Directory üzerinde kilitli kullanıcı hesaplarını listeler.

.DESCRIPTION
    Bu script, domain ortamında kilitlenmiş kullanıcı hesaplarını listeler.
    Sistem yöneticileri tarafından günlük kontrol ve kullanıcı destek süreçlerinde kullanılabilir.

.NOTES
    Gerçek kurum adı, domain veya kişisel veri içermez.
    Çalıştırmak için ActiveDirectory PowerShell modülü gereklidir.
#>

Import-Module ActiveDirectory

Write-Host "Active Directory üzerinde kilitli kullanıcılar kontrol ediliyor..." -ForegroundColor Cyan

$LockedUsers = Search-ADAccount -LockedOut -UsersOnly |
    Select-Object Name, SamAccountName, LockedOut, LastLogonDate

if ($LockedUsers) {
    $LockedUsers | Format-Table -AutoSize
}
else {
    Write-Host "Kilitli kullanıcı hesabı bulunamadı." -ForegroundColor Green
}
