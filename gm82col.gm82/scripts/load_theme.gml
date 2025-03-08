var a0;a0=argument0
if parameter_count()<1 and a0==undefined load_theme_reg()
else {
    myv=parameter_string(1)
    if myv=='' myv=a0
    if myv=='dialog' myv=get_open_filename('gm82col color file|*.82col|Registry color file|*.reg|GM:S1.4 color file|*.col','')
    if myv=='' exit //{show_message('Okay, cancelling loading color theme then...') exit}
    if !file_exists(myv) {show_message("Sorry, but file "+myv+" doesn't exist.") exit}

    f=file_text_open_read(myv)
    if f {
        switch(filename_ext(myv)) {
            case ".82col": {
                while !file_text_eof(f) {
                mystr=file_text_read_string(f)
                file_text_readln(f)
                i=0 repeat(12) {
                    if string_copy(mystr,1,string_pos(';',mystr)-1)==lname[i] codeColor[i]=to_color(real(string_number(string_copy(mystr,string_pos(';',mystr)+1,255))))
                    i+=1
                }
                }
                break;
            }
            case ".col": {
                while !file_text_eof(f) {
                mystr=file_text_read_string(f)
                file_text_readln(f)
                mycolpos=string_pos('<Color',mystr)+6
                myendpos=string_pos('</Color',mystr)
                i=0 repeat(12) {
                    if real(string_digits(string_copy(mystr,mycolpos,2)))==i codeColor[i]=to_color(real(string_number(string_cut(mystr,mycolpos+string_length(string_digits(string_copy(mystr,mycolpos,2)))+1,myendpos))))
                    i+=1
                }
                }
                break;
            }
            case ".reg": {
                while !file_text_eof(f) {
                    mystr=file_text_read_string(f)
                    file_text_readln(f)
                    if string_copy(mystr,2,9)=='CodeColor' {
                        codeColor[real(string_digits(string_copy(mystr,11,2)))]=to_color(real_hex(string_copy(mystr,string_pos(':',mystr)+3,255)))
                    }
                    if string_copy(mystr,2,8)=='FontName' {
                        mm=string_copy(mystr,13,string_length(mystr)-14)
                        font=font_add(mm,12,1,0,0,255)
                    }
                }
                break;
            }
        }
    file_text_close(f)
    }
}
