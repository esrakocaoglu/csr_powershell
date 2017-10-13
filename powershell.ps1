Write-host "##########################################################################"

foreach ($arg in $args){
  if($arg -eq '-yardim')     #burada aldığın arguman eşittir help ise sunları yap diyor
  {   
    Write-Host '-kullanicilar     burada kullanicilar hakkinda bilgi toplar'      
    Write-Host '-sistem           sistem hakkinda bilgi toplar'
    Write-Host '-servisler        servisler hakkinda bilgi toplar' 
    Write-Host '-gorevler         gorevler hakkinda bilgi toplar' 
    Write-Host '-domainbilgileri    domain bilgileri hakkinda bilgi toplar' 
    Write-Host '-netstat   
  }

Write-host "##########################################################################"

  If($arg -eq '-kullanicilar')
  { Get_AD_Users_Logon_History.ps1 -MaxEvent 800 -LastLogonOnly -OuOnly 
  }

Write-host "##########################################################################"

  if($arg -eq '-sistem')
  {   
    Get-WmiObject -Class Win32_Desktop -ComputerName . 
    Write-host "**********************************************************************"
    Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType 
    Write-host "**********************************************************************"
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property Build*,OSType,ServicePack*
    Write-host "**********************************************************************"
    gwmi Win32_processor | Select Name,ProcessId
  }

Write-host "##########################################################################"

  if($arg -eq '-domainbilgileri')
  {     
    Get-ADDomain
    
Write-host "##########################################################################"   
    
  }

  if($arg -eq '-servisler')
  {
  get-process

Write-host "##########################################################################"

  }

  if($arg -eq '-gorevler')
  {
    schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
   
  }

Write-host "##########################################################################"

  if($arg -eq '-netstat')
  {
    netstat -ant
   
  } 
 
