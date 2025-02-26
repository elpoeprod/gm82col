#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
load_theme()

text_margin=192
rect_margin=196

font_width=10
font_height=16

text_border=32

rect_width=30
rect_height=rect_width

text=' %3// Create a new variable%\
%0myvar=%2"Hello, world!"%\
%3// Now draw it%\
%t%6draw_text%0(%25%0,%n%25%0,%0myvar);%\
%3// Now format var to random numbers %\%+// if mouse y>max mouse y%\
%0myvar=%7my_format%0(myvar,%5mouse_y%0>%4MAX_MOUSE_Y%n%0)%\
%3// Now output it%\
%6draw_text%n%0(%8objPlayer%0.%5x%0,%8objPlayer%0.%5y%0+%255%0,myvar)%\
%3// The test was made, set %sglobalvar to 1.%e%\
%1global%0.test_end=%21%\
'
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///color picker
draw_set_color(c_dkgray)
draw_rectangle(0,0,256,room_height,0)
draw_set_font(fntMain)
draw_set_halign(fa_right)
i=0 repeat(labels) {
    select=clamp(floor((mouse_y-32)/text_border),0,labels-1)
    if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x,mouse_y,rect_margin,32+i*text_border,rect_margin+rect_width,32+i*text_border+rect_height)
        codeColor[select]=get_color($000000)
    draw_set_color(c_white)
    draw_text(text_margin,32+i*text_border,label[i])
    draw_set_color(codeColor[i])
    draw_rectangle(rect_margin,32+i*text_border,rect_margin+rect_width,32+i*text_border+rect_height,0)
    draw_set_color(0)
    draw_rectangle(rect_margin,32+i*text_border,rect_margin+rect_width,32+i*text_border+rect_height,1)
    i+=1
}
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_text(5,room_height-128,"Please close GameMaker#before saving changes.")

if draw_button_ext(32,room_height-80,128,32,noone,'SAVE THEME') {save_theme()}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///code formatting
code_margin=4
code_margin_left=256
draw_set_color(codeColor[9])
draw_rectangle(256,0,room_width,room_height,0)
draw_set_color(c_white)
selected=0
i=0 ii=0 h=0 repeat(string_length(text)) {
    switch(string_copy(text,i,1)) {
        case "%":
            var mystr;mystr=string_copy(text,i+1,1)
            if mystr=='%' {draw_text(code_margin_left+h*font_width,code_margin+ii*font_height,string_copy(text,i+1,1)) h+=1}
            else if mystr=='\' {h=0 ii+=1}
            else if mystr=='n' {draw_set_color(c_white)}
            else if mystr=='+' {h+=2}
            else if mystr=='t' {draw_set_color(codeColor[10]) draw_rectangle(code_margin_left,code_margin+ii*font_height+2,room_width,code_margin+(ii+1)*font_height+3,0)}
            else if mystr=='s' {selected=1}
            else if mystr=='e' {selected=0}
            else {draw_set_color(codeColor[real_hex(string_copy(text,i+1,1))])}
            i+=1
            break;
        default:
            if selected {
                draw_set_color(codeColor[11])
                draw_rectangle(code_margin_left+(h)*font_width,code_margin+ii*font_height+2,
                code_margin_left+(h+1)*font_width,code_margin+(ii+1)*font_height+2,0)
                draw_set_color(c_white)
                draw_text(code_margin_left+h*font_width,code_margin+ii*font_height,string_copy(text,i,1))
            } else
                draw_text(code_margin_left+h*font_width,code_margin+ii*font_height,string_copy(text,i,1))
            h+=1
            break;
    }
    i+=1

}
