Function GetStorageAccountByLocationAndVMSize($location, $vmSize)
{
    #Write-Host "$location, $vmSize"

    if ( ( $location -eq "australiaeast" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciaustraliaestxiov2"
    }
    elseif ( ( $location -eq "australiaeast" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciaustraliaeastv2"
    }
    elseif ( ( $location -eq "australiasoutheast" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciaussouthestxiov2"
    }
    elseif ( ( $location -eq "australiasoutheast" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciaussouthestv2"
    }
    elseif ( ( $location -eq "brazilsouth" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacibrazilsouthxiov2"
    }
    elseif ( ( $location -eq "brazilsouth" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacibrazilsouthv2"
    }
    elseif ( ( $location -eq "canadacentral" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicanadacntralxiov2"
    }
    elseif ( ( $location -eq "canadacentral" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicanadacentralv2"
    }
    elseif ( ( $location -eq "canadaeast" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicanadaeastxiov2"
    }
    elseif ( ( $location -eq "canadaeast" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicanadaeastv2"
    }
    elseif ( ( $location -eq "centralus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicentralusxiov2"
    }
    elseif ( ( $location -eq "centralus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacicentralusv2"
    }
    elseif ( ( $location -eq "eastasia" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastasiaxiov2"
    }
    elseif ( ( $location -eq "eastasia" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastasiav2"
    }
    elseif ( ( $location -eq "eastus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastusxiov2"
    }
    elseif ( ( $location -eq "eastus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastusv2"
    }
    elseif ( ( $location -eq "eastus2" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastus2xiov2"
    }
    elseif ( ( $location -eq "eastus2" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacieastus2v2"
    }
    elseif ( ( $location -eq "japaneast" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacijapaneastxiov2"
    }
    elseif ( ( $location -eq "japaneast" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacijapaneastv2"
    }
    elseif ( ( $location -eq "northcentralus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacinorthcntrlusxiov2"
    }
    elseif ( ( $location -eq "northcentralus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacinorthcentralusv2"
    }
    elseif ( ( $location -eq "northeurope" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacineuropexiov2"
    }
    elseif ( ( $location -eq "northeurope" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacineuropev2"
    }
    elseif ( ( $location -eq "southcentralus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisouthcntrlusxiov2"
    }
    elseif ( ( $location -eq "southcentralus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisouthcentralusv2"
    }
    elseif ( ( $location -eq "southeastasia" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisouthestasiaxiov2"
    }
    elseif ( ( $location -eq "southeastasia" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisoutheastasiav2"
    }
    elseif ( ( $location -eq "southindia" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisouthindiaxiov2"
    }
    elseif ( ( $location -eq "southindia" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkacisouthindiav2"
    }
    elseif ( ( $location -eq "ukwest" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciukwestxiov2"
    }
    elseif ( ( $location -eq "ukwest" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciukwestv2"
    }
    elseif ( ( $location -eq "westcentralus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestcentrlusxiov2"
    }
    elseif ( ( $location -eq "westcentralus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestcentralusv2"
    }
    elseif ( ( $location -eq "westeurope" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwesteuropexiov2"
    }
    elseif ( ( $location -eq "westeurope" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwesteuropev2"
    }
    elseif ( ( $location -eq "westus" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestusxiov2"
    }
    elseif ( ( $location -eq "westus" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestusv2"
    }
    elseif ( ( $location -eq "westus2" ) -and (($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestus2xiov2"
    }
    elseif ( ( $location -eq "westus2" ) -and (!($vmSize -match 'DS' -or $vmSize -match 'GS' -or ($vmSize.Trim().EndsWith("s")) )) )
    {
        $storageAccount = "konkaciwestus2v2"
    }
    #Write-Host "Selected Storage Account : $storageAccount"
    return $storageAccount
}

Function ValidateVHD($vhdPath)
{
    try
    {
        $tempVHDName = Split-Path $vhdPath -leaf
        Write-Host "Inspecting $tempVHDName..."
        $vhdInfo = Get-VHD -Path $vhdPath -ErrorAction Stop
        Write-Host "  VhdFormat            :$($vhdInfo.VhdFormat)"
        Write-Host "  VhdType              :$($vhdInfo.VhdType)"
        Write-Host "  FileSize             :$($vhdInfo.FileSize)"
        Write-Host "  Size                 :$($vhdInfo.Size)"
        Write-Host "  LogicalSectorSize    :$($vhdInfo.LogicalSectorSize)"
        Write-Host "  PhysicalSectorSize   :$($vhdInfo.PhysicalSectorSize)"
        Write-Host "  BlockSize            :$($vhdInfo.BlockSize)"
        Write-Host "Validation successful."
    }
    catch
    {
        Write-Host "Failed: Get-VHD -Path $vhdPath"
        Throw "INVALID_VHD_EXCEPTION"
    }
}

Function ValidateMD5($filePath, $expectedMD5hash)
{
    Write-Host "Verifying MD5 of $filePath"
    $hash = Get-FileHash -Path $filePath -Algorithm MD5
    if ($hash.Hash.ToUpper() -eq  $expectedMD5hash.ToUpper())
    {
        Write-Host "MD5 checksum verified successfully: $($hash.Hash)"
    }
    else
    {
        Write-host "Expected: $expectedMD5hash"
        Write-Host "Calculated: $($hash.Hash)"
        Throw "MD5 checksum verification failed."
    }
}

function Test-FileLock {
  param (
    [parameter(Mandatory=$true)][string]$Path
  )

  $oFile = New-Object System.IO.FileInfo $Path

  if ((Test-Path -Path $Path) -eq $false) {
    return $false
  }

  try {
    $oStream = $oFile.Open([System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)

    if ($oStream) {
      $oStream.Close()
    }
    $false
  } catch {
    # file is locked by a process.
    return $true
  }
}