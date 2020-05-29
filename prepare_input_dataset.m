function [ nl_data ] = prepare_input_dataset( dataset )
%Prepare dataset

min_data=min(dataset);
max_data=max(dataset);

min_rep=repmat(min_data,size(dataset,1),1);
max_rep=repmat(max_data,size(dataset,1),1);

nl_data=(dataset-min_rep)./(max_rep - min_rep);

end

