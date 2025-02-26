///draw_button_ext(x,y,w,h,color,txt)
var dx,dy,w,h,up,col,u,v,down,spr,txt;

dx=argument0
dy=argument1
w=argument2
h=argument3

up=mouse_check_button(mb_any)&&point_in_rectangle(mouse_x,mouse_y,dx,dy,dx+w,dy+h)
col=argument4
txt=argument5

if (col!=noone) {
    draw_sprite_ext(spr1x1,0,dx,dy,w,h,0,col,1)
}

down=up

draw_sprite_part(buttontex,down,0,0,4,4,dx,dy)
draw_sprite_part(buttontex,down,76,0,4,4,dx+w-4,dy)
draw_sprite_part(buttontex,down,0,21,4,4,dx,dy+h-4)
draw_sprite_part(buttontex,down,76,21,4,4,dx+w-4,dy+h-4)

draw_sprite_part_ext(buttontex,down,5,0,70,4,dx+4,dy,(w-8)/70,1,$ffffff,1)
draw_sprite_part_ext(buttontex,down,5,21,70,4,dx+4,dy+h-4,(w-8)/70,1,$ffffff,1)
draw_sprite_part_ext(buttontex,down,0,5,4,15,dx,dy+4,1,(h-8)/15,$ffffff,1)
draw_sprite_part_ext(buttontex,down,76,5,4,15,dx+w-4,dy+4,1,(h-8)/15,$ffffff,1)

draw_text(dx+5,dy+5,txt)

return mouse_check_button_released(mb_any)&&point_in_rectangle(mouse_x,mouse_y,dx,dy,dx+w,dy+h)
