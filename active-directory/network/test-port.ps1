<#
.SYNOPSIS
    Belirtilen IP adresi veya sunucu üzerinde port bağlantı testi yapar.

.DESCRIPTION
    Bu script, sistem yöneticilerinin bir sunucuya veya servise erişim olup olmadığını
    hızlıca test etmesi için hazırlanmıştır. Örneğin RDP, HTTP, HTTPS, SMTP veya özel
    uygulama portları kontrol edilebilir.

.EXAMPLE
    .\test-port.ps1 -ComputerName "192.168.1.10" -Port 443

.NOTES
    Gerçek kurum IP adresi veya domain bilgisi içermez.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$ComputerName,

    [Parameter(Mandatory = $true)]
    [int]$Port
)

Write-Host "Bağlantı testi başlatılıyor..." -ForegroundColor Cyan
Write-Host "Hedef: $ComputerName"
Write-Host "Port : $Port"

$Result = Test-NetConnection -ComputerName $ComputerName -Port $Port

if ($Result.TcpTestSucceeded) {
    Write-Host "Bağlantı başarılı." -ForegroundColor Green
}
else {
    Write-Host "Bağlantı başarısız." -ForegroundColor Red
}

$Result |
Select-Object ComputerName, RemoteAddress, RemotePort, TcpTestSucceeded
