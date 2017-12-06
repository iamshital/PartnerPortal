Param( $BuildNumber,
$JobUser
)
try
{
    $VHD=$env:VHD
    $RegionVMsize=$env:RegionVMsize
    $TestSuite=$env:TestSuite
    $Email=$env:Email
    $customKernel = $env:customKernel


    $exitValue = 1
    Import-Module J:\Jenkins\userContent\vendortesting.psm1 -Force -Global

    $missingParameters = @()
    $exitValue = 1
    #Validate Parameters
    If(!(Test-Path VHD -ErrorAction SilentlyContinue))
    {
        $missingParameters += "VHD"
        #Throw "Missing VHD file."
    }
    If($RegionVMsize -eq $null)
    {
        $missingParameters += "RegionVMsize"
        #Throw "Missing parameter 'RegionVMsize'."
    }
    If($Email -eq $null)
    {
        $missingParameters += "Email"
        #Throw "Missing parameter 'Email'."
    }
    If($TestSuite -eq $null)
    {
        $missingParameters += "TestSuite"
        #Throw "Missing parameter 'TestSuite'."
    }

    if ($missingParameters.Count -gt 0 )
    {
        $j = 1
        
        Write-Host "Following parameters are missing - "
        foreach($parameter in $missingParameters)
        {
            Write-Host "`t$j`t$parameter" 
            $j += 1  
        }
        Throw "MISSING_PARAMETERS_EXCEPTION"
    }


    $userContentHomeDir = "J:\Jenkins\userContent"

    $7zExePath = "J:\Jenkins\userContent\azure-linux-automation\tools\7za.exe"
    #$vhdPath = "J:\temp\redhat72-demo-dynamic.vhd.xz"
    $vhdPath = $VHD
    Write-Host "Job builder - $JobUser"

    if ($VHD)
    {
        Remove-Item -Path $VHD -Force -ErrorAction SilentlyContinue
        Write-Host "Using user provided file $VHD ..."
        Rename-Item -Path VHD -NewName $VHD
    
        if (($VHD).ToLower().EndsWith("xz"))
        {
            Write-Host "Extracting $VHD. Please wait..."
            $7zConsoleOuput = Invoke-Expression -Command "$7zExePath -y x $vhdPath;"
            if ($7zConsoleOuput -imatch "Everything is Ok")
            {
                Write-Host "Extraction completed."

                $vhdActualSize = ($7zConsoleOuput -imatch "size").Replace(" ",'').Replace(" ",'').Replace(" ",'').Replace(" ",'').Split(":")[1]
                $vhdCompressedSize = ($7zConsoleOuput -imatch "Compressed").Replace(" ",'').Replace(" ",'').Replace(" ",'').Replace(" ",'').Split(":")[1]
                $compressinRatio = ((($vhdCompressedSize/($vhdActualSize-$vhdCompressedSize))*100))
            
                Write-Host "Compression Ratio : $compressinRatio%"
                $newVHDName = ($VHD).TrimEnd("xz").TrimEnd(".")
                Write-Host "Removing file $VHD"
                Remove-Item -Path $VHD -Force
            }
            else
            {
                Throw "Error: Failed to extract $VHD."
            }
        }
        elseif (($VHD).ToLower().EndsWith("vhd") -or ($VHD).ToLower().EndsWith("vhdx"))
        {
            $newVHDName = ($VHD)
        }
        else
        {
            Write-Host "$($VHD) is NOT supported. Supported file formats: vhd, vhdx and xz (compressed VHD/VHDX) file."
            Throw "UNSUPPORTED_FILE_EXCEPTION"
        }

        Write-Host "Creating $newVHDName.json file..."


        if ($env:MultipleTestCycles)
        {
        #Prepare Multiple Test JSON file.

        }
        else
        {
            #region Prepare Single Test JSON file.
            $testRegion = (($RegionVMsize).Split(" ")[0]).Trim()
            $testVMSize = (($RegionVMsize).Split(" ")[1]).Trim()
            $singleTestJSONText = Get-Content "$userContentHomeDir\JSON\SingleTestJSON.json"
            $singleTestJSONText = $singleTestJSONText.Replace("CustomTestCycleName","$TestSuite")
            $singleTestJSONText = $singleTestJSONText.Replace("CustomVMSize","$testVMSize")
            $singleTestJSONText = $singleTestJSONText.Replace("CustomRegion","$testRegion")
            $singleTestJSONText = $singleTestJSONText.Replace("CustomPublisher","$JobUser")
            $singleTestJSONText = $singleTestJSONText.Replace("CustomEmail","$Email")
            $singleTestJSONText = $singleTestJSONText.Replace("custom_Kernel","$customKernel")
            if ($env:GitRepo)
            {
                $singleTestJSONText = $singleTestJSONText.Replace("iamshital","$env:GitRepo")
            }
            if ($env:GitBranch)
            {
                $singleTestJSONText = $singleTestJSONText.Replace("ostcci","$env:GitBranch")
            }
            #Write-Host $singleTestJSONText
            Set-Content -Value $singleTestJSONText -Path "$newVHDName.json" -Force
            Write-Host "Created $newVHDName.json file..."
            #endregion
        }

        #Validate VHD before upload.
        ValidateVHD -vhdPath $newVHDName
        $jsonItem = "$newVHDName.json"
        $jsonTxt = [string](Get-Content -Path "$jsonItem")
        $jsonObj = ConvertFrom-Json -InputObject $jsonTxt
        if ( $jsonObj.md5)
        {
            ValidateMD5 -filePath $newVHDName -expectedMD5hash $jsonObj.md5
        }
        if ( $jsonObj.publisher -imatch "suse")
        {
            $monitorDir = "Q:\suse-ftp-rw"
        }
        if ( $jsonObj.publisher -imatch "redhat")
        {
            $monitorDir = "Q:\redhat-ftp-rw"
        }
        if ( $jsonObj.publisher -imatch "suse")
        {
            $monitorDir = "Q:\suse-ftp-rw"
        }
        if ( $jsonObj.publisher -imatch "ubuntu")
        {
            $monitorDir = "Q:\ubuntu-ftp-rw"
        }
        if ( $jsonObj.publisher -imatch "msft")
        {
            $monitorDir = "Q:\msftuser-ftp-rw"
        }

        Write-Host "Moving $newVHDName to $($jsonObj.publisher) queue directory."
        
        Move-Item -Path $newVHDName -Destination $monitorDir -Force
        
        Write-Host "Moving $newVHDName.json to $($jsonObj.publisher) queue directory."
        Move-Item -Path "$newVHDName.json" -Destination $monitorDir -Force
        Write-Host "Your VHD is received successfully."
        Write-Host "You will receive email notifications, when-"
        Write-Host "  1. we upload VHD to azure storage account."
        Write-Host "  2. we start the tests."
        Write-Host "  3. we finish the tests."
        $exitValue = 0    
    }
    else
    {
        Write-Host "Error: You did not provide any VHD file."
        $exitValue = 1
    }
}
catch
{
    Write-Host $_.Exception.GetType().FullName, " : ",$_.Exception.Message
    exit 1
}
finally
{
    exit $exitValue
}
