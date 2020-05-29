% Section 3: Testing training split
global num_training;
num_xv=5;
training_split=[10:20:200];
avg=zeros(1,length(training_split)); %iniitalizing vectors
SD=avg; combined_acc=zeros(length(training_split),5);
for task5_iter=1:length(training_split)
    acc=zeros(1,num_xv);
    num_training=training_split(task5_iter);
    Cross_validation
    avg(task5_iter)=mean(acc);
    SD(task5_iter)=std(acc);
    combined_acc(task5_iter,:)=acc;
    clear true_val train_values test_values test_input test_output train_input train_output
end
% plotting
errorbar(avg,SD,'x')
set(gca,'Xticklabel',[training_split])
xlabel('Num of training used')
ylabel('Ratio of correct')
title('Training/testing split');