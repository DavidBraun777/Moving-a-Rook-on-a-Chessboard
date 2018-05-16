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
## @deftypefn {Function File} {@var{retval} =} walkingPlot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-24

function walkingPlot(xs, ys, map, n, name, save)
  
  subplot(1,2,1);
  plot(xs, ys, "b*-");
  axis ([1, 8, 1, 8], "square");
  title("Rook Path", "fontsize", 27);
  xlabel("x", "fontsize", 19);
  ylabel("y", "fontsize", 19);
  set(gca,'fontsize',20);
  grid on;
  
%  subplot(1,3,2);
%  hist(lengths, "r");
%  title("Histogram of Lengths", "fontsize", 27);
%  xlabel("Steps", "fontsize", 19);
%  ylabel("Count", "fontsize", 19);
%  set(gca,'fontsize',20);
%  grid on;
  
  subplot(1,2,2);
  bar3octave(map./(n+1), name, false);
  
  if (save)
    saveas (1, name);
  endif

endfunction