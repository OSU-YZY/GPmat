function [h, compUpAA, compUpAP] =  lfmComputeH3AA(gamma1_p, gamma1_m, sigma2, t1, ...
    t2, preFactor, mode)

% LFMCOMPUTEH3AA Helper function for computing part of the LFMAA kernel.
% FORMAT
% DESC computes a portion of the LFMAA kernel.
% ARG gamma1 : Gamma value for first system.
% ARG gamma2 : Gamma value for second system.
% ARG sigma2 : length scale of latent process.
% ARG t1 : first time input (number of time points x 1).
% ARG t2 : second time input (number of time points x 1).
% ARG preFactor : precomputed constants.
% ARG mode: indicates the correct derivative.
% RETURN h : result of this subcomponent of the kernel for the given values.
%
% COPYRIGHT : Mauricio Alvarez, 2010

% GPMAT

% Evaluation of h

if nargout>1    
    [compUpAA{1}, compUpAP{1}] = lfmaaComputeUpsilonMatrix(gamma1_p,sigma2, t1,t2, mode);
    [compUpAA{2}, compUpAP{2}] = lfmaaComputeUpsilonMatrix(gamma1_m,sigma2, t1,t2, mode);
    h = preFactor(1)*compUpAA{1} + preFactor(2)*compUpAA{2};
else
    h = preFactor(1)*lfmaaComputeUpsilonMatrix(gamma1_p,sigma2, t1,t2, mode) ...
        + preFactor(2)*lfmaaComputeUpsilonMatrix(gamma1_m,sigma2, t1,t2, mode);
end
