%% Plinko
close all

h0 = 31; % change the height of the game (positive odd numbers only)
nameorder = {'A','B','C','D','E','F','G','H'};
holdtime = 0.25; % change length of pause between steps in seconds
toptitle = 'Plinko!';
scramble = 1; % 1 to scramble names order, 0 to leave order as above

% No need to edit anything below this line.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

left = length(nameorder);
names = {};
neworder = randperm(left);
if scramble ==1
    for i=1:left
        names{i} = nameorder{neworder(i)};
    end
else
    names = nameorder;
end

x1 = ones((h0+1)/2,1);
xr = 1:left;
y1 = ones(1,left);
yc = 0:2:h0-1;
yc = yc';
xd1 = x1*xr;
yd1 = yc*y1;
xd2 = xd1+0.5;
yd2 = yd1+1;

xdot = [xd1;xd2];
ydot = [yd1;yd2];

%% Create Blank Board with Names
g = figure(1);
plot(xdot,ydot,'k.','MarkerSize',12)
axis([0.5,left+1,0,h0+2])
yticks([])
xticks(1:left)
xticklabels(names)
xtickangle(45)
set(g, 'Position',  [200, 100, 900, 500])
set(gca,'FontSize',12)
title(toptitle,'Color',[0,0.5,0.1])

prompt = ['Select your starting position 1-',num2str(left),': '];
x = input(prompt);
h = h0;
hold on
g1 = plot(x,h,'o','MarkerSize',13,'Linewidth',1.4,'Color',[0.7,0,0.2]);
set(g1, 'markerfacecolor', [0.95,0,0.05])
plot(xdot,ydot,'k.','MarkerSize',12)
hold off
axis([0.5,left+1,0,h0+2])
yticks([])
xticks(1:left)
xticklabels(names)
xtickangle(45)
set(g, 'Position',  [200, 100, 900, 500])
set(gca,'FontSize',12)
title(toptitle,'Color',[0,0.5,0.1])
while h>1
    pause(holdtime)
    move = randi(2);
    if move == 1
        x=x-0.5;
    else
        x=x+0.5;
        
    end
    if x>left+0.5
        x=1;
    elseif x<1
        x=left+0.5;
    end
    h = h-1;
    clf
    hold on
    g1 = plot(x,h,'o','MarkerSize',13,'Linewidth',1.4,'Color',[0.7,0,0.2]);
    set(g1, 'markerfacecolor',[0.95,0,0.05])
    plot(xdot,ydot,'k.','MarkerSize',12)
    hold off
    axis([0.5,left+1,0,h0+2])
    yticks([])
    xticks(1:left)
    xticklabels(names)
    xtickangle(45)
    set(gca,'FontSize',12)
    title(toptitle,'Color',[0,0.5,0.1])
end
