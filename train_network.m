function [net] = train_network(net, train_input, train_output, l_rate, n_epoch)
%Train a number for a fixed number of epochs
old_error=100;
for e=1:n_epoch
    
    sum_error=0;
    
% Learning rate changes with epochs
%{  
    if e<100
        l_rate=3;
    else 
        l_rate=0.05;
    end
%}
    for r=1:size(train_input,1)
        % Gets input output
        input=train_input(r,:);
        output=train_output(r,:);
        
        %runs foward propagate
        [net,pred] = forward_propagate(net,input);
        
        % Calculates the total error 
        sum_error=sum_error+sum((pred-output).^2);
        [net] = backward_propagate_error(net,output);
        % Update the weights after finding error at each node
        [net] = update_weights(net, l_rate);
        
    end
    % new code
    q_error(e) = sum_error; 
    d_error = 1;
    disp(['Epoch: ' num2str(e) ', l_rate=' num2str(l_rate) ', error=' num2str(sum_error)]);
    if e >=2
    d_error=abs(q_error(e-1)-q_error(e))/q_error(e-1);
    end

    %disp(['Epoch: ' num2str(e) ', l_rate=' num2str(l_rate) ', percent change=' num2str(100*d_error)]);
    if e>=4 && d_error < .01
        %break

    disp(['Epoch: ' num2str(e) ', l_rate=' num2str(l_rate) ', percent change=' num2str(100*d_error)]);
    if e>=4 && d_error < .0001
        break

    end
    end
    
end

