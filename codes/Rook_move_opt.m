## Copyright (C) 2018 Alek Lukanen
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} Rook_move_opt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-27

## A valid point from (x0,y0) is generated and returned to
## the caller as x1 and y1.
## x0 - The initial x position the Rook starts at.
## y0 - The initial y position the Rook starts at.
## map - The map of the board, this needs to be an 8X8 matrix
##       and can have -1s where there are holds and 0 everywhere else.
function [x1 y1] = Rook_move_opt (x0, y0, map)

  #initialize the new points.
  x1 = 0;
  y1 = 0;
  
  #if the map at the points given is -1
  #then return x1=-1 and y1=-1.
  if (map(x0,y0)==-1)
    printf('.');
    x1 = -1;
    y1 = -1;
    return;
  endif
  
  #generate a new point using this loop.
  while (true)
    #determines which path to move down
    column_or_row = floor(2*rand())+1;
    rand_xy = floor(8*rand())+1;
    if (column_or_row==1) #take the column
      x1 = x0;
      y1 = rand_xy;
    else #take the row
      x1 = rand_xy;
      y1 = y0;
    endif
    
    #is the square not blocked off and is the piece not in the position
    if (map(x1,y1)!=-1 && (x1!=x0 || y1!=y0))
      
      #was the choice a column
      if (column_or_row==1)
        check_y0 = 0;
        check_y1 = 0;
        if y1>y0 #greater than the previous point
          check_y0 = y0;
          check_y1 = y1;
        else #less than or equal to the previous point
          check_y0 = y1;
          check_y1 = y0;
        endif
        
        #where all of the points up to the proposed point not equal to -1
        if (map(x1, check_y0:check_y1)!=-1)
          break;
        endif
        
      #was the choice a row
      else
        check_x0 = 0;
        check_x1 = 0;
        if x1>x0 #greater than the previous point
          check_x0 = x0;
          check_x1 = x1;
        else #less than or equal to the previous point
          check_x0 = x1;
          check_x1 = x0;
        endif
        
        #where all of the points up to the proposed point not equal to -1
        if (map(check_x0:check_x1, y1)!=-1)
          break;
        endif
        
      endif
      
    else
      #try, try, again
      continue;
    endif
    
  endwhile

endfunction

