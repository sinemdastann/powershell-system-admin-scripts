# PowerShell System Admin Scripts

Bu repo, Windows Server, Active Directory, Microsoft 365 ve temel sistem yönetimi süreçlerinde kullanılabilecek PowerShell scriptlerini içermektedir.

## Amaç

Sistem yöneticilerinin günlük operasyonlarında ihtiyaç duyabileceği kullanıcı kontrolü, hesap kilitlenme takibi, lisans kontrolü, DNS/port testi ve temel raporlama işlemlerini kolaylaştırmak.

## İçerik

- Active Directory kullanıcı ve hesap kontrolleri
- Kilitli kullanıcıları listeleme
- Pasif kullanıcı raporlama
- DNS ve port bağlantı testleri
- Microsoft 365 lisans kontrol örnekleri
- Windows Server günlük kontrol komutları

## Klasör Yapısı

```text
powershell-system-admin-scripts/
├── active-directory/
├── microsoft-365/
├── network/
├── windows-server/
└── README.md
```
## Güvenlik Notu

Bu repoda kurum adı, gerçek domain, gerçek IP adresi veya kişisel veri kullanılmamalıdır. Tüm örnekler test ortamına uygun şekilde hazırlanmalıdır.

## Kullanım

Scriptleri çalıştırmadan önce PowerShell'i yönetici olarak açmanız ve gerekli modüllerin yüklü olduğundan emin olmanız önerilir.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Script Listesi

| Klasör | Dosya | Açıklama |
|---|---|---|
| active-directory | locked-users.ps1 | Active Directory üzerinde kilitli kullanıcı hesaplarını listeler. |
| active-directory | disabled-users-report.ps1 | Active Directory üzerinde devre dışı bırakılmış kullanıcı hesaplarını raporlar. |
| network | test-port.ps1 | Belirtilen IP adresi veya sunucu üzerinde port bağlantı testi yapar. |
| windows-server | service-status-check.ps1 | Windows Server üzerinde önemli servislerin durumunu kontrol eder. |
| microsoft-365 | license-check.ps1 | Microsoft 365 kullanıcı lisans durumlarını Microsoft Graph ile kontrol eder. |

## Hazırlayan

Sinem Daştan  
Sistem Destek Uzmanı
