# Disable 'Diagnostic Data':
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Value 0
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'MaxTelemetryAllowed' -Value 0

# Disable 'Store my activity history on this device':
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Value 0

# Disable 'Send my activity history to Microsoft':
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Value 0

# Disable 'Improve inking and typing' (send diagnostics to Microsoft):
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Input\TIPC' -Name 'Enabled' -Value 0

# Disable 'Tailored Experiences' (personalized ads, recommendations, and tips):
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -Value 0

# Disable 'Getting to know you' (don't save typing history and handwriting patterns):
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore' -Name 'HarvestContacts' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -Value 0

# Disable 'Advertisement ID' (don't allow apps to follow your interests):
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0 
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Id' -ErrorAction SilentlyContinue

# Data Collection Scheduled Tasks and Services:
Disable-ScheduledTask -TaskPath '\Microsoft\Windows\Application Experience' -TaskName 'Microsoft Compatibility Appraiser'
Disable-ScheduledTask -TaskPath '\Microsoft\Windows\Customer Experience Improvement Program' -TaskName 'Consolidator'

Set-Service -Name DiagTrack -StartupType Disabled
Stop-Service -Name DiagTrack
