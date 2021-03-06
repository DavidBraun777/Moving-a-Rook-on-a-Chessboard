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
## @deftypefn {Function File} {@var{retval} =} Rook_move (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alek Lukanen <alek@mortensen-141-224-238-209.augsburg.edu>
## Created: 2018-02-22

## A simplified verison of the Rook_move_opt function.
function [x1 y1] = Rook_move(x0, y0)
  map = zeros(8,8); #A board with no holes.
  [x1 y1] = Rook_move_opt(x0, y0, map);
endfunction