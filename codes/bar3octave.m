function bar3octave(Z, name, save);

  %
  %**************************************************************
  % Create a 3D bar plot for the input two-dimensional matrix Z.
  % No checking is being done if Z is a 2D matrix.
  %
  % Inputs:
  %    Z: a two-dimensional array (matrix) of real numbers
  %
  % Output:
  %    none
  %
  % Usage:
  %    bar3octave(Z) ... Z a 2D matrix
  %    bar3octave([1 2 3; 4 5 6; 7 8 9])
  %
  % Written by PB, January 21, 2015.
  % (Based on a code by Rody Oldenhuis from
  %  http://stackoverflow.com/questions/24180890/3d-histogram-with-gnuplot-or-octave)
  %**************************************************************
  %

  #graphics_toolkit("fltk")

  %clf;
  hold on;
  view(-37.5, 40);
  %view(3);
  #view ([azimuth elevation])

  %# the "nominal" bar (adjusted from cylinder())
  n = 4;
  r = [0.5; 0.5];
  m = length(r);
  theta = (0:n)/n*2*pi + pi/4;

  x0 = r * cos(theta);
  y0 = r * sin(theta);
  z0 = (0:m-1)'/(m-1) * ones(1,n+1);

  %# get data for current colormap
  map = colormap; #("jet")
  Mz = max(Z(:));
  mz = min(Z(:));
  
  % Each "bar" is 1 surf and 1 patch
  for ii = 1:size(Z,1)
      for jj = 1:size(Z,2)

          % Get color (linear interpolation through current colormap)
          cI = (Z(ii,jj)-mz)*(size(map,1)-1)/(Mz-mz) + 1;
          fC = floor(cI);
          cC = ceil(cI);
          color = map(fC,:) + (map(cC,:) - map(fC,:)) * (cI-fC);
          
          % Translate and rescale the nominal bar
          x = x0+ii;
          y = y0+jj;
          z = z0*Z(ii,jj);

          % Draw the bar
          surf(x,y,z, 'Facecolor', color)
          patch(x(end,:), y(end,:), z(end,:), color)

      end
  end

  colorbar;
  caxis([mz Mz]);
  axis([0, size(Z,1)+1, 0, size(Z,2)+1]);
  
  title("Distribution", "fontsize", 27);
  xlabel("x", "fontsize", 19);
  ylabel("y", "fontsize", 19);
  

  if (save)
    saveas (1, name);
  endif
  
  hold off;
  
endfunction
