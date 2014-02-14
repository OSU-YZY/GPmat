function mgaussianNoiseDisplay(noise, spacing)


% MGAUSSIANNOISEDISPLAY Display parameters of the MGAUSSIAN noise.
% FORMAT
% DESC displays the parameters of the multiple output Gaussian
% noise and the noise type to the console.
% ARG noise : the noise to display.
%
% FORMAT does the same as above, but indents the display according
% to the amount specified.
% ARG noise : the noise to display.
% ARG spacing : how many spaces to indent the display of the noise by.
%
% SEEALSO : mgaussianNoiseParamInit, modelDisplay, noiseDisplay
%
% COPYRIGHT : Neil D. Lawrence, 2004, 2005

% GPMAT


if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);

for i = 1:noise.numProcess
  fprintf(spacing)
  fprintf('MGaussian bias on process %d: %2.4f\n', i, noise.bias(i))
  fprintf(spacing)
  fprintf('MGaussian variance on process %d: %2.4f\n', i, noise.sigma2(i))
end

