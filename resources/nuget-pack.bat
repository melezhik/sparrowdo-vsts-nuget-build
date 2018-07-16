set configuration=%1
set project_file=%2

nuget pack %project_file% -Properties Configuration=%configuration% -OutputDirectory out -Build

