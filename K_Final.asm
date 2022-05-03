.model Medium
.8086
.data
frequency1 equ 523;
number_cycles1 equ 1000
.stack
dw 128 dup(0)

.code 
start:
mov ax,@data
mov ds,ax
mov es,ax

Input:
mov ah,1
int 21h
cmp al,27
je exit

call check
jmp Input

Click:
call sound
jmp Input

exit:
mov ax,4ch
int 21h



check proc near
cmp al,'1'
je Click
cmp al,'3'
je Click
cmp al,'5'
je Click
cmp al,'7'
je Click
cmp al,'9'
je Click
cmp al,45
je Click
cmp al,8
je Click
cmp al,9 
je Click
cmp al,119
je Click
cmp al,114
je Click
cmp al,121
je Click
cmp al,105
je Click
cmp al,112
je Click
cmp al,93
je Click
cmp al,97
je Click
cmp al,100
je Click
cmp al,103
je Click
cmp al,106
je Click
cmp al,108
je Click
cmp al,39
je Click
cmp al,14
je Click
cmp al,120
je Click
cmp al,118
je Click
cmp al,110
je Click
cmp al,44
je Click
cmp al,47
je Click
cmp al,46
je Click
ret
check endp


sound proc near
mov dx,500
mov di,500

;ton0 proc near
cli
in al,61h
or al,3
out 61h,al
mov ax,di
out 42h,al 
xchg al,ah
out 42h,al
mov cx,dx 
ton01: push cx 
pop cx
loop ton01
in al,61h
and al,0fch 
out 61h,al
sti
ret
;ton0 endp 
sound endp ; Конец процедуры генерации звука 1


end start