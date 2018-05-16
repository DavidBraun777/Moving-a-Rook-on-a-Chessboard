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
## @deftypefn {Function File} {@var{retval} =} Rook_journey_opt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-27

## Returns the average number of steps needed to get from one
## corner of the board (1,1) to the other corner of the board (8,8).
## N - The number of trials (sample paths).
## map - The map of the board, this needs to be an 8X8 matrix
##       and can have -1s where there are holds and 0 everywhere else.
## directory - The directory to save the figure.
## save - The boolean value to decided if the figure should be saved or not. 
function avg_steps = Rook_journey_opt (N, map, directory, save)
  
  #the name of the file.
  name = strcat(directory,"/figure_Rook_journey_N",mat2str(N),".png");
  
  #The number of steps for each sampel path.
  number_of_steps = zeros(1,N);
  
  #run the simulation for each sample path.
  for path=1:N
    map_copy = map; #get a copy of the board
    x = y = 1; #start from the bottom left
    #increment the number of steps by one
    number_of_steps(path) = number_of_steps(path) +1;
    #increment the count in the map by one
    map_copy(x,y) = map_copy(x,y) +1;
    #For the given 
    while(true)
      [x_p1, y_p1] = Rook_move_opt(x,y,map_copy);
      map_copy(x_p1,y_p1) = map_copy(x_p1,y_p1) +1;
      number_of_steps(path) = number_of_steps(path) +1;
      x = x_p1;
      y = y_p1;
      if (x==8 && y==8)
        break;
      endif
    endwhile
    
  endfor
  
  #print the name is you are going to save
  if (save)
    disp(name);
  endif
  
  %number_of_steps
  histPlot(number_of_steps, name, save);
  avg_steps = mean(number_of_steps);
  
endfunction