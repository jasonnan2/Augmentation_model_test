function accuracy=model(training_set, testing_set)
    rng(0) % comment out the rng seed so we can get true cross-validation
    
    train_input=prepare_input_dataset(training_set(:,1:end-1));
    train_output=prepare_output_dataset(training_set(:,end));
    
    test_input=prepare_input_dataset(testing_set(:,1:end-1));
    test_output=prepare_output_dataset(testing_set(:,end));
    
    

    % Initialize network
    n_hidden = 2;
    n_inputs=size(data_input,2);
    n_outputs=size(data_output,2);
    net=initialize_network(n_inputs,n_hidden,n_outputs);


    % Set training parameters
    l_rate = 0.3; n_epoch = 200;
    [net] = train_network(net, train_input, train_output, l_rate, n_epoch);

    for j=1:size(test_output,1)
        true_val(j)=find(test_output(j,:)==max(test_output(j,:)));
    end
    [test]=predict(net, test_input);

    correct=numel(find(test==true_val));
    accuracy=correct/length(test);
end
