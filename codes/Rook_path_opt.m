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
## @deftypefn {Function File} {@var{retval} =} Rook_path_opt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-28

## The path of the rook is computed using this function
## x0 - The initial x position the Rook starts at.
## y0 - The initial y position the Rook starts at.
## map - The map of the board, this needs to be an 8X8 matrix
##       and can have -1s where there are holds and 0 everywhere else.
## n - The number of steps to take in the walk.
## directory - The directory to save the figure.
## save - The boolean value to decided if the figure should be saved or not.
function probabilities = Rook_path_opt (x0, y0, map, n, directory, save)
  
  #A copy of the original map
  original_map = map;
  
  #Set the x and y values and increment the 
  #count at that position by one if possible.
  x = x0;
  y = y0;
  if (map(x,y)!=-1)
    map(x,y) = map(x,y) +1;
  endif
  
  #The arrays for the positions.
  xs = zeros(1,n);
  ys = zeros(1,n);
  lengths = zeros(1,n-1);
  
  #record the position if the number of steps
  #is less than min_n.
  min_n = 100;
  index = 1;
  if (n<min_n)
    xs(index) = x0;
    ys(index) = y0;
    index++;
  endif
  
  #the for loop for the stepping of the Rook.
  for i=1:n
    [x_p1, y_p1] = Rook_move_opt(x,y,map); #get a new position
    map(x_p1,y_p1) = map(x_p1,y_p1) +1; #increment the count of the new position.
    #record the position if the number of steps is less than min_n.
    if (n<min_n) 
      xs(index) = x_p1;
      ys(index) = y_p1;
      lengths(index) = sqrt((x_p1-x)^2+(y_p1-y)^2);
      index++;
    endif
    #set the current x and y to the proposed x and y.
    x = x_p1;
    y = y_p1;
  endfor
  
  #remove the holes in the map (remove the -1s)
  map = RemoveHole(original_map, map);
  
  #find the probability of landing on each of the squares.
  probabilities = map./(n+1);
  
  #decided whether or not to plot the walk or the 3D bar chart.
  if (n<min_n)
    #the name of the graph.
    name = strcat(directory,"/figure_Rook_path_n",mat2str(n),"_x",mat2str(x0),"_y",mat2str(y0),".png");
    walkingPlot(xs,ys, map, n, name, save);
  else
    name = strcat(directory,"/figure_Rook_path_n",mat2str(n),".png");
    bar3octave(probabilities, name, save);
  endif
  
  #print the name is you are going to save
  if (save)
    disp(name);
  endif
  
endfunction


