i=0 repeat(12) {
    codeColor[i]=to_color(registry_read_dword('Software\Game Maker\Version 8.2\Preferences\CodeColor'+string(i),-1))
    if codeColor[i]<0 {
        show_message('Error occured. Check if Game maker was installed on your pc.')
        game_end()
        exit
    }
    i+=1
}
labels=12
label[0]='Normal text: '
label[1]='Keywords: '
label[2]='Values: '
label[3]='Comments: '
label[4]='Constants: '
label[5]='Variables: '
label[6]='Functions: '
label[7]='Script Names: '
label[8]='Resource Names: '
label[9]='Background: '
label[10]='Current Line: '
label[11]='Selection: '
