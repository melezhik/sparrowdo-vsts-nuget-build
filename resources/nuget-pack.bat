set nuget_bin=%1
set configuration=%2
set project_file=%3
set output_directory=%4

%nuget_bin% pack %project_file% -Properties Configuration=%configuration% -OutputDirectory %output_directory% -Build

