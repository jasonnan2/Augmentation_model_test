function [ activation ] = activate(weights, inputs )
%Calculate neuron activation for an input

activation = weights(end);

for i=1:(length(inputs)-1)
    activation = activation + weights(i).*inputs(i); %weighted sum of all the input weights
end


end

