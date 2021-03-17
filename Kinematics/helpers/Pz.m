function [MATRIX] = Pz(dist)
	MATRIX = [
		1 0 0 0;
		0 1 0 0;
		0 0 1 dist;
		0 0 0 1;
		];
	end