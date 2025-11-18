# VM PowerShell SSH function
vmps() {
    ssh parallels-win powershell -Command "$*"
}

vm-connect() {
    ssh parallels-win powershell
}