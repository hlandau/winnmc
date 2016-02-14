@cls
@type winnmc.wxs >nul
@type winnmcui.wxs >nul
candle -nologo -ext WixSystemToolsExtension.dll -ext WixUtilExtension -ext WixFirewallExtension winnmc.wxs
@if errorlevel 1 goto FAIL
candle -nologo winnmcui.wxs
@if errorlevel 1 goto FAIL
candle -nologo UserExit.wxs Common.wxs WixUI_FeatureTree.wxs VerifyReadyDlg.wxs MaintenanceTypeDlg.wxs CustomizeDlg.wxs WelcomeDlg.wxs PrepareDlg.wxs BrowseDlg.wxs MaintenanceWelcomeDlg.wxs OutOfDiskDlg.wxs OutOfRbDiskDlg.wxs ErrorDlg.wxs FatalError.wxs FilesInUse.wxs CancelDlg.wxs ProgressDlg.wxs ResumeDlg.wxs ExitDialog.wxs LicenseAgreementDlg.wxs DiskCostDlg.wxs WaitForCostingDlg.wxs MsiRMFilesInUse.wxs
@if errorlevel 1 goto FAIL
light -nologo -cc cache -reusecab -ext WixSystemToolsExtension.dll -ext WixUtilExtension -ext WixFirewallExtension -cultures:en-us -o winnmc.msi winnmc.wixobj Common.wixobj UserExit.wixobj BrowseDlg.wixobj CustomizeDlg.wixobj MaintenanceTypeDlg.wixobj WelcomeDlg.wixobj PrepareDlg.wixobj WixUI_FeatureTree.wixobj VerifyReadyDlg.wixobj MaintenanceWelcomeDlg.wixobj OutOfDiskDlg.wixobj OutOfRbDiskDlg.wixobj ErrorDlg.wixobj FatalError.wixobj FilesInUse.wixobj CancelDlg.wixobj LicenseAgreementDlg.wixobj ProgressDlg.wixobj ResumeDlg.wixobj ExitDialog.wixobj WaitForCostingDlg.wixobj DiskCostDlg.wixobj MsiRMFilesInUse.wixobj -loc WixUI_en-us.wxl
@if errorlevel 1 goto FAIL

@goto END
:FAIL
@echo Failed
:END
