% DEMSWISSROLL1 Model the face swiss roll with a 2-D GPLVM.

% GPMAT

% Fix seeds
randn('seed', 1e6);
rand('seed', 1e6);

dataSetName = 'swissRollFull';
experimentNo = 1;

% load data
[Y, lbls] = lvmLoadData(dataSetName);

% Set up model
options = fgplvmOptions('dtcvar');

latentDim = 2;
d = size(Y, 2);
model = fgplvmCreate(latentDim, d, Y, options);

% Optimise the model.
iters = 1000;
display = 1;

model = fgplvmOptimise(model, display, iters);

% Save the results.
modelWriteResult(model, dataSetName, experimentNo);

if exist('printDiagram') & printDiagram
  lvmPrintPlot(model, lbls, dataSetName, experimentNo);
end



% Display results
fgplvmScatterPlotColor(model, model.y(:, 3));