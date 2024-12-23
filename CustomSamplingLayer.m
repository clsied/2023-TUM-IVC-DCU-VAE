classdef CustomSamplingLayer < nnet.layer.Layer
    properties
        % properties
    end
    methods
        function layer = CustomSamplingLayer(args)

            arguments
                args.Name = "";% if the Name is not pass
            end

            layer.Name = args.Name;
            layer.Type = "custom";
            layer.Description = "Sampling according to given mean and logVar";
            layer.InputNames = {'mu', 'logVar'};
            layer.OutputNames = ["Z" "mu" "logVar"];

        end
        function [Z, mu, logVar] = predict(~, mu, logVar)
            epsilon = randn(size(mu));  % Sample from N(0,1)
            Z = mu + exp(0.5 * logVar) .* epsilon;  % Scaling and shifting
        end

    end
    
end