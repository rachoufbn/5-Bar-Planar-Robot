% Square EE Positions

function [EE] = SquareXY(Center, radius, n)

% Calculate number of points per side, ensuring corners are included once
ppe = n / 4; % Points per edge

% Define corners
TL = [Center(1,1) - radius, Center(1,2) + radius]; % top left
TR = [Center(1,1) + radius, Center(1,2) + radius]; % top right
BL = [Center(1,1) - radius, Center(1,2) - radius]; % bottom left
BR = [Center(1,1) + radius, Center(1,2) - radius]; % bottom right

% Points on each edge
TE = [linspace(TL(1), TR(1), ppe + 1)', repmat(TR(2), ppe + 1, 1)];%top
RE = [repmat(BR(1), ppe + 1, 1), linspace(TR(2), BR(2), ppe + 1)'];%right
BE = [linspace(BR(1), BL(1), ppe + 1)', repmat(BL(2), ppe + 1, 1)];%bottom
LE = [repmat(BL(1), ppe + 1, 1), linspace(BL(2), TL(2), ppe + 1)'];%left

% Combined edges removing last point of each edge to avoid duplicates
EE = [TE; RE(1:end-1, :); BE(1:end-1, :); LE(1:end-1, :)];