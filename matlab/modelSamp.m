function Y = modelSamp(model, X)

% MODELSAMP Give a sample from a model for given X.

% GPMAT

fhandle = str2func([model.type 'Samp']);
Y = fhandle(model, X);