\ include "C:\Users\mav\Desktop\FORTH_PRG\krest-nol.f"
." start_xo  -- start game "
." restart_xo -- restart game "
." exit_xo -- exit game "

9 constant size
create plot_ size allot
plot_ size erase
: i_ ( index -- ) plot_ + ;
: in_stack 0 8 do I i_ c@ -1 +loop ;

: ?p dup 0= if ."  " else
	dup 1 = if ." X" else
		dup 255 = if ." 0" else
then then then drop ;

: plot_out
cls
 in_stack
cr
	?p ."  | " ?p ."  |" ?p cr
	." --------- " cr
	?p ."  | " ?p ."  |" ?p cr
	." --------- "cr
	?p ."  | " ?p ."  |" ?p cr
.sd_n
;

: ?occ

;

: fill_plot
	swap 1- dup i_ @
	0= IF i_ c!
	ELSE ." The cell is occupied (enter key to continue) " wait
	THEN
	plot_out ;


: X ( ход -- )
	1 fill_plot ;
: O ( ход -- )
	-1 fill_plot ;

: start_xo plot_out ;
: restart_xo plot_ size erase start_xo ;
: exit_xo plot_ size erase .sd_n ;
