i=0 repeat(12) {
    registry_write_dword('Software\Game Maker\Version 8.2\Preferences\CodeColor'+string(i),codeColor[i])
    i+=1
}
