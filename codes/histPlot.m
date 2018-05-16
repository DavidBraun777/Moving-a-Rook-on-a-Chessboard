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
## @deftypefn {Function File} {@var{retval} =} histPlot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@aleks-MacBook-Pro.local>
## Created: 2018-02-24

function histPlot (lengths, name, save)

  subplot(1,1,1);
  hist(lengths, "r");
  title("Histogram of Lengths", "fontsize", 27);
  xlabel("Steps", "fontsize", 19);
  ylabel("Count", "fontsize", 19);
  set(gca,'fontsize',20);
  grid on;
  
  if(save)
    saveas(1, name);
  endif
  
endfunction
