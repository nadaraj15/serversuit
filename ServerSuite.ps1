#########################################################################################
#
#                      Server Suite
#  
# This program is helps you to fix comman issue in windows server
# 
#  
# This is script will work on domain joined machines. 
#  
#
#########################################################################################



<#---------------------------APP Configration------------------------- #>
$nl = [Environment]::NewLine


<#---------------------------Program Execution------------------------- #>
do {
  [int] $choice1 = 0
  while ( $choice1 -lt 1 -or $choice1 -gt 14) {
Write-Host "Welcome to Server Suite,'$env:UserName'"$nl -ForegroundColor GREEN
Write-Host "Please enter the service category:$nl
            1 = Restart RDP Services (Remote Desktop) 
            2 = SQL Services includes Analysis Services, SQL Agent etc (Start, Stop, Restart)
            3 = Download file from online  
            4 = Copy file or files using path or location
            5 = Check Disk Space
            6 = Check currently logged users/session and disconnect them          
            7 = Check CPU & Memory Usage
            8 = Exit$nl


"
$choice1 = read-host -prompt "Select number & press enter"

switch ($choice1) 
    { 
       
       1{ #************************** Remote Desktop Service Restart *****************************************#
           cls
           [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
            $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
             Write-Host "Please wait for a moment until RDP service being restarted..."
             Function Restart-RdpServices {
	          param($ComputerName)
              Get-Service -ComputerName $ComputerName -Name 'Remote Desktop Services UserMode Port Redirector' | Stop-Service -Force -Verbose
              Get-Service -ComputerName $ComputerName -Name 'TermService' | Stop-Service -Force -Verbose
              Get-Service -ComputerName $ComputerName -Name 'TermService' | Start-Service -Verbose
              Get-Service -ComputerName $ComputerName -Name 'Remote Desktop Services UserMode Port Redirector' | Start-Service -Verbose
            } 
             Restart-RdpServices $pcname 
            
          }
        
    
       
       
       2{  do { #*******************SQL Services**************************#
                cls 
               [int] $choice2 = 0
               while ( $choice2 -eq 1 -or  $choice2 -eq 0) {
               Write-Host "Please enter the Service to perform$nl$nl
            1  = Start SQL Service $nl 
            2  = Stop SQL Service$nl
            3  = Restart SQL Service $nl

            4  = Start SQL Server Analysis Services $nl
            5  = Stop SQL Server Analysis Services $nl
            6  = Restart SQL Server Analysis Services $nl

            7  = Start SQL Server Agent Service $nl
            8  = Stop SQL Server Agent Service $nl
            9  = Restart SQL Server Agent Service $nl
            10 = Exit
"
           $choice2 = read-host -prompt "Select number & press enter"
           
           switch ($choice2) 
              { 
                 1 {#*******************Start SQL Service**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Start-Service -DisplayName "SQL Server (MSSQLSERVER)" -PassThru -Confirm -ErrorAction SilentlyContinue
                                     Start-Sleep -s 3
                                     Start-Service -DisplayName "SQL Server Launchpad (MSSQLSERVER)" -PassThru -Confirm -ErrorAction SilentlyContinue
                                   } 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                        Start-Sleep -s 7                       
                    
                    } 

                       
                 2{#*******************Stop SQL Service**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Stop-Service -DisplayName "SQL Server (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                    } 

                 3{ #*******************Restart SQL Service**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Restart-Service -DisplayName "SQL Server (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                  }
                 
                 4{#*******************Start SQL Server Analysis Services**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Start-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                  }
                  5{#*******************Stop SQL Server Analysis Services**************************#

                       [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Stop-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                  }
                 6{#*******************Restart SQL Server Analysis Services**************************#

                       [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Restart-Service -DisplayName "SQL Server Analysis Services (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                  }
                 7{#*******************Start SQL Server Agent**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Start-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                    }
                  8{#*******************Stop SQL Server Agent**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Stop-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                    
                    }
                  9{#*******************Restart SQL Server Agent**************************#

                        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                        $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                        Invoke-Command -Computername $pcname -ScriptBlock{ 
                        $result =  Get-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -ErrorAction SilentlyContinue
                        if($result){ Restart-Service -DisplayName "SQL Server Agent (MSSQLSERVER)" -Force -PassThru -Confirm -ErrorAction SilentlyContinue} 
                        else{Write-Host "Not able to find the default instance on "+$pcname}
                        }
                    }

                 10 {break
                   }
                          
                 default {""}
                 }
            cls } 
            cls} while ( $choice2 -ne 10 )

                        
             }

             3{ #*******************Download in server**************************#
                #Enter Downloadable Url and Filename with extension
                
                     $url=" to download file"
                       function ToDownloadFile {
                         param (
                            [string]$URL,
                            [string]$FILE_NAME,
                            [validateset('exe', 'msi', 'ps1', 'vsix', 'zip')]
                            [string]$FILE_EXTENSION,
                            [validateset('C', 'D', 'E', 'K', 'L', 'I', 'Z')]
                            [string]$DESTINATION_DRIVE
                        )
                        [pscustomobject]@{
                            url = $URL
                            filename = $FILE_NAME
                            extension = $FILE_EXTENSION
                            drive = $DESTINATION_DRIVE
                        }
                    }
                        $URL=$result.url
                        $DRIVE=$result.drive
                        $result = Invoke-Expression (Show-Command ToDownloadFile -PassThru)
                        $fileName=''
                        $fileName=($result.filename)+'.'+($result.extension)
                                
                    # Path for the workdir
                           $workdir = $DRIVE+":\installer\"

                    # Check if work directory exists if not create it

                    If (Test-Path -Path $workdir -PathType Container)
                        { #Write-Host "$workdir already exists" -ForegroundColor Red
                        }
                    
                    ELSE
                        { New-Item -Path $workdir  -ItemType directory }

                        # Download the installer
                        $source = $URL
                        $destination = "$workdir\$fileName"
                        Write-Host "Please wait for a moment..."
                         Start-Sleep -s 20
                       
                        # Check if Invoke-Webrequest exists otherwise execute WebClient
                             
                        if (Get-Command 'Invoke-Webrequest')
                            {
                             Write-Host "Downloading..."
                            Start-Sleep -s 30
                            Invoke-WebRequest $source -OutFile $destination  
                            }
                        else
                            {Start-Sleep -s 30
                           $WebClient = New-Object System.Net.WebClient  
                           $webclient.DownloadFile($source, $destination)
                            }
                        ii $workdir     
              
              }
                       
                        
             4{#************************** Copy FILE *****************************************#
                     cls                  
                          
                       $result=''
                       $Destination =''
                       $Source=''
                       $FileType=''
                       function ToCopy {
                         param (
                            
                            [string]$Source,
                            [string]$Destination
                            #,[validateset('*.*','*.bak', '*.mdf', '*.ldf')]
                            #[string]$FileType
                            )
                       
                        [pscustomobject]@{
                            
                            destination = $Destination
                            source = $Source  
                            filetype=$FileType 
                        }
                    }
                    $result = Invoke-Expression (Show-Command ToCopy -PassThru)
                   

                   if($result) { 
                    $Destination =$result.destination
                    $Source=$result.source
                    $extension=$result.filetype
                    write-host "Please wait while copying the files.."  -ForegroundColor YELLOW
                    copy-item -path "$Source" -Destination "$Destination" -Recurse
                    #| where {($_.Name -match $extension) }
                      [void] [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") 
                      [Microsoft.VisualBasic.Interaction]::MsgBox("Processing Completed. 
 Copied file(s) from $Source to $Destination", "OKOnly,SystemModal,Information", "Success")
                     }
                           
                     else {Write-Host "No file found" }
             
              }
             
             
             
             
             5{#************************** Check Disk Space *****************************************#
               cls
                   [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                    $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                     write-host $pcname
                     write-host "----------------"
                     Function Get-Size {
	                  param($ComputerName)
                      $Computers = "$ComputerName"  
                        foreach ($Computer in $Computers)  
                        {  
 
                        $Disks = Get-wmiobject  Win32_LogicalDisk -computername $Computer -ErrorAction SilentlyContinue -filter "DriveType= 3" #-Credential $cred 
                        $Servername = (Get-wmiobject  CIM_ComputerSystem -ComputerName $computer).Name 
                        write-host $Compute -ForegroundColor GREEN
                        foreach ($objdisk in $Disks)  
                        {  
                                $out=New-Object PSObject 
                            $total=“{0:N0}” -f ($objDisk.Size/1GB)  
                            $free=($objDisk.FreeSpace/1GB)  
                            $freePercent=“{0:P0}” -f ([double]$objDisk.FreeSpace/[double]$objDisk.Size)  
                                $out | Add-Member -MemberType NoteProperty -Name "Servername" -Value $Servername 
                                $out | Add-Member -MemberType NoteProperty -Name "Drive" -Value $objDisk.DeviceID  
                                $out | Add-Member -MemberType NoteProperty -Name "Total size (GB)" -Value $total 
                                $out | Add-Member -MemberType NoteProperty -Name “Free Space (GB)” -Value $free 
                                $out | Add-Member -MemberType NoteProperty -Name “Free Space (%)” -Value $freePercent 
                                $out | Add-Member -MemberType NoteProperty -Name "Name " -Value $objdisk.volumename 
                                $out | Add-Member -MemberType NoteProperty -Name "DriveType" -Value $objdisk.DriveType 
                            #$out | export-csv $path\Diskspace_Report.csv -NoTypeInformation -Append  
                                write-host $objDisk.DeviceID "Drive" -ForegroundColor Yellow
                         "--------" 
                            write-host " Total Size=$total GB "     " | Free Space=$free GB "      " | Free Space (%) = $freePercent " -ForegroundColor GREEN
                        }    
                        } 
                    } 
              
                    Get-Size($pcname)
                    
                     do { 
                       [int] $choice2 = 0
                       while ( $choice2 -eq 0) {
                       
                   $choice2 = read-host -prompt "Please enter 1 to go back to main menu"
           
                   switch ($choice2) 
                      { 
                         1 { 
                            } 
                                                                    
                         default {""}
                         }
                     } 
                    } while ( $choice2 -ne 1 )
                  
        
                
              }
             
             6{    #************************** Check and disconnect Logon Session *****************************************#
                    cls
                    Write-Host '******************************'
                    Write-Host '* Log Off User Remotely *'
                    Write-Host '******************************'
                    Write-Host
                    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                    $global:ComputerName = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                    #$global:adminCreds = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "")
                    #$global:ComputerName = Read-Host 'Computer Name?'
                    write-host $global:ComputerName  -ForegroundColor green
                     write-host "----------------"  -ForegroundColor green
                    Function getSessions {
                    Write-host
                    Write-host "Getting user sessions..."
                    Write-Host
                    Write-Host '***************************************************************************'
                    Invoke-Command -ComputerName $global:ComputerName -scriptBlock {query session} 
                    #-credential $global:adminCreds
                    }
 
                    Function logUserOff {
                    Write-Host
                    $SessionNum = Read-Host 'Session ID number to log off?'
                    $title = "Log Off"
                    $message = "Are you sure you want to log them off?"
                    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
                    "Logs selected user off."
                    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
                    "Exits."
                    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
                    $result = $host.ui.PromptForChoice($title, $message, $options, 1)
 
                    switch ($result){
                    0 {
                    Write-Host
                    Write-Host 'OK. Logging them off...'
                    Invoke-Command -ComputerName $global:ComputerName -scriptBlock {logoff $args[0]} -ArgumentList $SessionNum
                    # -credential $global:adminCreds
                    Write-Host
                    Write-Host 'Success!' -ForegroundColor green
                    break
                    }
                    1 {break}
                    }
                    }
 
                    Do {
                    getSessions
                    logUserOff
 
                    Write-Host
                    #Write-Host "Press any key to continue ..."
                    # $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
 
                    #Configure yes choice
                    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Remove another profile."
 
                    #Configure no choice
                    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"
 
                    #Determine Values for Choice
                    $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)
 
                    #Determine Default Selection
                    [int]$default = 0
 
                    #Present choice option to user
                    $userchoice = $host.ui.PromptforChoice("","Logoff Another Profile?",$choice,$default)
                    }
                    #If user selects No, then quit the script
                    Until ($userchoice -eq 1)

                      do{             [int] $choice2 = 0
                                     while ($choice2 -eq 0 -or $choice2 -eq 0) {
                       
                                       $choice2 = read-host -prompt "Please enter 1 to check on another server and 2 to exit"
           
                                       switch ($choice2) 
                                          { 
                                             1 {
                                             
                                                cls
                                                Write-Host '******************************'
                                                Write-Host '* Log Off User Remotely *'
                                                Write-Host '******************************'
                                                Write-Host
                                                  [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                                                $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                                                #$global:adminCreds = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "")
                                                #$global:ComputerName = Read-Host 'Computer Name?'
                                                Function getSessions {
                                                Write-host
                                                Write-host "Getting user sessions..."
                                                Write-Host
                                                Write-Host '***************************************************************************'
                                                Invoke-Command -ComputerName $global:ComputerName -scriptBlock {query session} 
                                                #-credential $global:adminCreds
                                                }
 
                                                Function logUserOff {
                                                Write-Host
                                                $SessionNum = Read-Host 'Session ID number to log off?'
                                                $title = "Log Off"
                                                $message = "Are you sure you want to log them off?"
                                                $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
                                                "Logs selected user off."
                                                $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
                                                "Exits."
                                                $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
                                                $result = $host.ui.PromptForChoice($title, $message, $options, 1)
 
                                                switch ($result){
                                                0 {
                                                Write-Host
                                                Write-Host 'OK. Logging them off...'
                                                Invoke-Command -ComputerName $global:ComputerName -scriptBlock {logoff $args[0]} -ArgumentList $SessionNum 
                                                #-credential $global:adminCreds
                                                Write-Host
                                                Write-Host 'Success!' -ForegroundColor green
                                                break
                                                }
                                                1 {break}
                                                }
                                                }
 
                                                Do {
                                                getSessions
                                                logUserOff
 
                                                Write-Host
                                                #Write-Host "Press any key to continue ..."
                                                # $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
 
                                                #Configure yes choice
                                                $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Remove another profile."
 
                                                #Configure no choice
                                                $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"
 
                                                #Determine Values for Choice
                                                $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)
 
                                                #Determine Default Selection
                                                [int]$default = 0
 
                                                #Present choice option to user
                                                $userchoice = $host.ui.PromptforChoice("","Logoff Another Profile?",$choice,$default)
                                                }
                                                #If user selects No, then quit the script
                                                Until ($userchoice -eq 1)
                                             
                                               }
                         2{
                          } 
                                                                    
                         default {""}
                         }
                     } 
                    } while ( $choice2 -ne 2 )

              } 
        7{
          #************************** Check Memory and CPU Usage *****************************************#
               cls
                   [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                    $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                     write-host $pcname -ForegroundColor GREEN
                     write-host "----------------"

                         Invoke-Command -Computername $pcname -ScriptBlock {

                        $totalMemory = (
                            Get-WmiObject -Class win32_physicalmemory -Property Capacity | 
                            Measure-Object -Property Capacity -Sum | 
                            Select-Object -ExpandProperty Sum
                        ) / 1MB

                        $availMemory = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue

                        $usedMemory = ($totalMemory - $availMemory) / $totalMemory * 100

                        If ( $usedMemory -lt 90 ) {
                            $memoryFlag = 1;
                            $process = Get-WmiObject -ComputerName localhost -Class Win32_Process | Sort-Object WS -Descending | Select -First 15

                            $process | Select-Object @{n='Owner';e={$_.GetOwner().User}}, Name, @{n='WS (MB)';e={[Math]::Round($_.WS / 1MB,2)}} | Format-Table -Property * -AutoSize | Out-String -Width 5096}
    
                            $x=$process.Name
                            $y=$process.Owner
                            #$z= [Math]::Round($process.WS/1MB,2)
  
                            $info= "Process Name:$x - Process Owner:$y - Memory Utilized (MB):$z"

                            $info= "Process Name:$x - Process Owner:$y - Memory Utilized (MB):$z"
                            
                            #Check CPU usage status
                            write-host "CPU usage Status" -ForegroundColor YELLOW
                            write-host "----------------------------" -ForegroundColor YELLOW
                            $resultcpu=""
                            $result=Get-Counter '\Processor(_Total)\% Processor Time'
                            $resultcpu=$result.CounterSamples.cookedValue
                            $resultcpu=[math]::Round($resultcpu,2)
                            write-host "CPU Usage = $resultcpu %"
                            Write-host "$nl$nl"


                            #Check Average memory usage status
                            write-host "Overall Memory usage Status" -ForegroundColor YELLOW
                            write-host "----------------------------" -ForegroundColor YELLOW
                         Function Test-MemoryUsage {
                        [cmdletbinding()]
                        Param()
 
                        $os = Get-Ciminstance Win32_OperatingSystem
                        $pctFree = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2)
 
                        if ($pctFree -ge 45) {
                        $Status = "OK"
                        }
                        elseif ($pctFree -ge 10 ) {
                        $Status = "Warning"
                        }
                        else {
                        $Status = "Critical"
                        }
 
                        $os | Select @{Name = "Status ";Expression = {$Status}},
                        @{Name = "Free Memory in Percentage %"; Expression = {$pctFree}},
                        @{Name = "Free Memory in GB";Expression = {[math]::Round($_.FreePhysicalMemory/1mb,2)}},
                        @{Name = "Total Memory in GB";Expression = {[int]($_.TotalVisibleMemorySize/1mb)}}
 
                        }
                        Test-MemoryUsage | format-list *

                        }
  do{             [int] $choice2 = 0
                 while ($choice2 -eq 0 -or $choice2 -eq 0) {
                       
                   $choice2 = read-host -prompt "Please enter 1 to check again and 2 to go back to main menu"
           
                   switch ($choice2) 
                      { 
                         1 { cls
                                            
                   [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null 
                    $pcname = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the server name like AZOCPPIDEVSQLXX")
                     write-host $pcname -ForegroundColor GREEN
                     write-host "----------------"

                                 Invoke-Command -Computername $pcname -ScriptBlock {

                                $totalMemory = (
                                    Get-WmiObject -Class win32_physicalmemory -Property Capacity | 
                                    Measure-Object -Property Capacity -Sum | 
                                    Select-Object -ExpandProperty Sum
                                ) / 1MB

                                $availMemory = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue

                                $usedMemory = ($totalMemory - $availMemory) / $totalMemory * 100

                                If ( $usedMemory -lt 90 ) {
                                    $memoryFlag = 1;
                                    $process = Get-WmiObject -ComputerName localhost -Class Win32_Process | Sort-Object WS -Descending | Select -First 15

                                    $process | Select-Object @{n='Owner';e={$_.GetOwner().User}}, Name, @{n='WS (MB)';e={[Math]::Round($_.WS / 1MB,2)}} | Format-Table -Property * -AutoSize | Out-String -Width 5096}
    
                                    $x=$process.Name
                                    $y=$process.Owner
                                    #$z= [Math]::Round($process.WS/1MB,2)
  
                                    $info= "Process Name:$x - Process Owner:$y - Memory Utilized (MB):$z"
                                      
                                      #Check CPU usage status
                                        write-host "CPU usage Status" -ForegroundColor YELLOW
                                        write-host "----------------------------" -ForegroundColor YELLOW
                                        $resultcpu=""
                                        $result=Get-Counter '\Processor(_Total)\% Processor Time'
                                        $resultcpu=$result.CounterSamples.cookedValue
                                        $resultcpu=[math]::Round($resultcpu,2)
                                        write-host "CPU Usage = $resultcpu %"
                                        Write-host "$nl$nl"


                                 #Check Average memory usage status
                                 write-host "Overall Memory Usage Status" -ForegroundColor YELLOW
                                 write-host "----------------------------" -ForegroundColor YELLOW
                                 Function Test-MemoryUsage {
                                [cmdletbinding()]
                                Param()
 
                                $os = Get-Ciminstance Win32_OperatingSystem
                                $pctFree = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2)
 
                                if ($pctFree -ge 45) {
                                $Status = "OK"
                                }
                                elseif ($pctFree -ge 10 ) {
                                $Status = "Warning"
                                }
                                else {
                                $Status = "Critical"
                                }
 
                                $os | Select @{Name = "Status ";Expression = {$Status}},
                                @{Name = "Free Memory in Percentage %"; Expression = {$pctFree}},
                                @{Name = "Free Memory in GB";Expression = {[math]::Round($_.FreePhysicalMemory/1mb,2)}},
                                @{Name = "Total Memory in GB";Expression = {[int]($_.TotalVisibleMemorySize/1mb)}}
 
                                }
                                Test-MemoryUsage | format-list *

                                }
                            }
                         2{
                          } 
                                                                    
                         default {""}
                         }
                     } 
                    } while ( $choice2 -ne 2 )
        }   

        8 { #*******************Exit*****************************
               cls
               
              
              Write-Host "Thank You, Good Day..!!" -ForegroundColor GREEN
              Start-Sleep -s 3

              stop-process -name "powershell"  -Force
            break
           } 


        default {""}
 }
 cls}
} while ( $choice1 -ne 8 )
 

  
        
            