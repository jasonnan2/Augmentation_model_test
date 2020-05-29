function [ data_mat ] = prepare_output_dataset( dataset )
%Turn label vector into 1-hot

if min(dataset(:))==0;
    dataset=dataset+1;
end
vect_length=max(dataset(:));

% making size consistent and in the form of the network
data_mat=zeros(size(dataset,1),vect_length);

for j=1:size(dataset,1)
    data_mat(j,dataset(j))=1;
end

end

