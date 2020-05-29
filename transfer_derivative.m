function [ derivative ] = transfer_derivative( output )
%Calcualte derivative of an neuron output

derivative = output * (1 - output);

end

