# csr_powershell
#aşağıdaki komutta giriş yapmış olan kullanıcıların listesini getirir
Get_AD_Users_Logon_History.ps1 -MaxEvent 800 -LastLogonOnly -OuOnly 
#asagidaki 4 komutta sistem adını, bilgisayar adını, isletim sistemi hakkındaki bilgileri getirir
Get-WmiObject -Class Win32_Desktop -ComputerName .   
Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType 
Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property Build*,OSType,ServicePack*
gwmi Win32_processor | Select Name,ProcessId
#bir alt satirdaki komut domain bilgilerini ceker
Get-ADDomain
#alt satirdaki komut ile servis hakkindaki bilgileri aliriz
get-process
#asagidaki komut sayesinde zamanlanmış-schedule edilmis görevleri çeker
schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
#netstat komutu da tcp baglantilari gibi baglantilari gosterir 
netstat -ant
