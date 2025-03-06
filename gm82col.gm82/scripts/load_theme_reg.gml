i=0 repeat(12) {
    codeColor[i]=to_color(registry_read_dword('Software\Game Maker\Version 8.2\Preferences\CodeColor'+string(i),-1))
    if codeColor[i]<0 {
        show_message('Error occured. Check if Game maker was installed on your pc.')
        game_end()
        exit
    }
    i+=1
}
