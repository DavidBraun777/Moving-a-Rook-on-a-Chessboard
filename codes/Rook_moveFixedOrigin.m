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
## @deftypefn {Function File} {@var{retval} =} Rook_moveFixedOrigin (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-25

%function Rook_moveFixedOrigin (x0, y0)
%  map = zeros(8,8);
%  Rook_moveFixedOrigin_opt(x0, y0, map, '', false);
%endfunction

## The path of the rook is computed using this function
## x0 - The initial x position the Rook starts at.
## y0 - The initial y position the Rook starts at.
## map - The map of the board, this needs to be an 8X8 matrix
##       and can have -1s where there are holds and 0 everywhere else.
## n - The number of steps to take in the walk.
## directory - The directory to save the figure.
## save - The boolean value to decided if the figure should be saved or not.
function Rook_moveFixedOrigin (x0, y0, map, n, directory, save)
  
  #the name of the graph.
  name = strcat(directory,"/figure_Rook_moveFixedOrigin_N",mat2str(n),"_x", mat2str(x0),"_y", mat2str(y0),".png");
  map_original = map; #a copy of the original map
  #if the piece starts off on a hole do nothing.
  if (map(x0,y0)==-1)
    disp('There was a hole at that point');
  else
    #increment the count at the original point
    map(x0, y0) = map(x0,y0) +1;
    #Generate a bunch of new samples from a fixed origin
    for i=1:n
      [x1, y1] = Rook_move_opt(x0, y0, map); #a new sample square
      map(x1,y1) = map(x1,y1) +1; #increment the count for that square
    endfor
    
    #remove the holes in the map (remove the -1s)
    map = RemoveHole(map_original, map);
    
    #print the name is you are going to save
    if (save)
      disp(name);
    endif
    
    #plot the 3D bar chart
    bar3octave(map./(n+1), name, save);
  endif
  
endfunction
