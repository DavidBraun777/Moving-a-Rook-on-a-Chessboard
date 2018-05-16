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
## @deftypefn {Function File} {@var{retval} =} GraphAll (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-25

## Graphs all plots needed for the paper.
## map - The map of the board, this needs to be an 8X8 matrix
##       and can have -1s where there are holds and 0 everywhere else.
## directory - The directory to save the figure.
## save - The boolean value to decided if the figure should be saved or not. 
## runtime: true for long and false for short. If true a few more 
##          long running computations will be run.
function GraphAll (map, directory, save, runtime)
  
  title = 'generating all Graphs';
  bar = waitbar(0.0, title);
  count = 23;
  if (runtime)
    count = count -2;
  endif
  index = 1;
  
  %firet set of graphs. These test the distribution of values
  % starting from various fixed positions.
  # Test cases to show that the movement function is
  # producing equally weighted samples for the next move.
  Rook_moveFixedOrigin(1, 1, map, 10^6, directory, save);
  index = increment(bar, index, count, title);
  
  Rook_moveFixedOrigin(8, 8, map, 10^6, directory, save);
  index = increment(bar, index, count, title);
  
  Rook_moveFixedOrigin(4, 4, map, 10^6, directory, save);
  index = increment(bar, index, count, title);
  
  Rook_moveFixedOrigin(1, 4, map, 10^6, directory, save);
  index = increment(bar, index, count, title);
  
  Rook_moveFixedOrigin(4, 1, map, 10^6, directory, save);
  index = increment(bar, index, count, title);
  
  %second set of graphs. These functions generate the graphs
  %for the paths.
  #Example paths starting from various places on the board.
  probabilities = Rook_path_opt(1,1, map, 5, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(1,1, map, 10, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(1,1, map, 25, directory, save);
  index = increment(bar, index, count, title);
  
  
  probabilities = Rook_path_opt(8,8, map, 5, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(8,8, map, 10, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(8,8, map, 25, directory, save);
  index = increment(bar, index, count, title);
  
  
  probabilities = Rook_path_opt(4,1, map, 5, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(4,1, map, 10, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(4,1, map, 25, directory, save);
  index = increment(bar, index, count, title);
  
  %third set of graphs. These methods generate 3d bar charts
  %for various n values starting from the first square on the
  %board.
  # (5a) The probabilities for each of the squares on the board.
  x0 = 1;
  y0 = 1;
  probabilities = Rook_path_opt(x0,y0, map, 10^2, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(x0,y0, map, 10^3, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(x0,y0, map, 10^4, directory, save);
  index = increment(bar, index, count, title);
  
  probabilities = Rook_path_opt(x0,y0, map, 10^5, directory, save);
  index = increment(bar, index, count, title);
  
  if (runtime)
    probabilities = Rook_path_opt(x0,y0, map, 10^6, directory, save);
    index = increment(bar, index, count, title);
    
    probabilities = Rook_path_opt(x0,y0, map, 10^7, directory, save);
    index = increment(bar, index, count, title);
  endif
  
  %the fourth set of graphs. This function generates 1000 paths and
  %averages them to find to find the average number of steps it takes
  %to get from the lower left to the upper right corner.
  # (5b) The average number of steps needed to get from one
  # corner to the next.
  average_steps = Rook_journey_opt(1000, map, directory, save);
  index = increment(bar, index, count, title);
  
  close(bar);
  close
  
  disp('average_steps: ');
  disp(average_steps);
  
  %bar3octave(probabilities)

endfunction

function iii = increment(bar, index, count, title)
  clf;
  waitbar(index/count, bar, title);
  iii = index + 1;
endfunction
