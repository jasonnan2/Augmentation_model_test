clear all;
rng(0) % comment out the rng seed so we can get true cross-validation

fname='seed_data';
load(fname);

task3=0;
clean=1;

data_input=seedsdataset(:,1:7);
[data_input]=prepare_input_dataset(data_input);

data_output=seedsdataset(:,8);
[data_output]=prepare_output_dataset(data_output);

n_hidden = 2;
n_inputs=size(data_input,2);
n_outputs=size(data_output,2);
net=initialize_network(n_inputs,n_hidden,n_outputs);

if clean
    train_values=randsample(210,30);
    test_values=setxor(train_values,1:210);
elseif task3
    start=ceil(rand*180);
    test_values=[start:start+30];
    train_values=setxor(test_values,1:210);
    elsee
    train_values=randsample(210,num_training);
    test_values=setxor(train_values,1:210);
end

train_input=data_input(train_values,:);
train_output=data_output(train_values,:);

test_input=data_input(test_values,:);
test_output=data_output(test_values,:);


l_rate = 0.3; n_epoch = 200;
[net] = train_network(net, train_input, train_output, l_rate, n_epoch);


for j=1:size(test_output,1)
    true_val(j)=find(test_output(j,:)==max(test_output(j,:)));
end
[test]=predict(net, test_input);

correct=numel(find(test==true_val));
accuracy=correct/length(test)