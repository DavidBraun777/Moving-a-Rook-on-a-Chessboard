format long;disp('+++ main +++');%printf('x1: %d\n', x1);%printf('y1: %d\n', y1);%disp('+++ test case 1 +++')%Rook_path(1,1, zeros(8,8), 3,'', false);%graph the regular chess board...%directory_regular = 'figures/regular'%save = true%map = zeros(8,8);%GraphAll(map, directory_regular, save, true);%graph the chess board with a hole in the middle...directory_withHole = 'figures/withHole'save = truemap = zeros(8,8);map(3:6, 4:5) = -1;GraphAll(map, directory_withHole, save, true);%map = zeros(8,8);%map(3:6, 4:5) = -1;%average_steps = Rook_journey(1000);%%probabilities = Rook_path(1,1, 10^5);