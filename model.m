function accuracy=model(training_set, testing_set)
    rng(0) % comment out the rng seed so we can get true cross-validation
    
    training_input=training_set(:,1:end-1);
    training_output=trainig_set(:,end);
    
    testing_input=testing_set(:,1:end-1);
    testing_output=testing_set(:,end);
    
    % Change for different type of data
    data_input=
    [data_input]=prepare_input_dataset(data_input);

    data_output=
    [data_output]=prepare_output_dataset(data_output);

    % Initialize network
    n_hidden = 2;
    n_inputs=size(data_input,2);
    n_outputs=size(data_output,2);
    net=initialize_network(n_inputs,n_hidden,n_outputs);

    % Format data into test/train input/output
    train_input=data_input(train_values,:);
    train_output=data_output(train_values,:);

    test_input=data_input(test_values,:);
    test_output=data_output(test_values,:);

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
