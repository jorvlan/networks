
%%enter in specific values here here
nTime = 735;
nNodes = 375;

addpath(genpath('/Users/jordyvanlangen/Desktop/General_code_scripts/matlab_scripts_gabriel/'))

%addpath('\Volumes\webdav.data.donders.ru.nl/dccn/"DSC_3011147.01_808//v1"') 
%addpath('/','Volumes/webdav.data.donders.ru.nl/dccn/DSC_3011147.01_808_v1/')


%parcellation file -- may need to change the path
parc = MRIread('/Users/jordyvanlangen/Desktop/General_code_scripts/matlab_scripts_gabriel/Parcels_Combo.nii.gz');

%output file -- can change this to a subjects' ID in a loop if you want
ts = zeros(nNodes,nTime);

t1_template = load_nifti('con_0001.nii');
t1_template_test = load_nifti('GG-853-T1-2.0mm.nii');
t1_template_test2 = load_nifti('T1.nii.gz');
t1_template_test3 = load_nifti('T1_brain.nii.gz');
t1_template_test4 = load_nifti('anon_s2015-04-14_09-35-102316-00001-00192-1.nii');
t1_template_test5 = load_nifti('anon_s2015-02-06_11-21-112358-00001-00192-1.nii');


%try to read the vol structure
vol = t1_template_test1925.vol(:,:,1:10);
vol_test = vol(:,:,1:10);

vol_test3 = 

for t = 1:nTime
  
    %load in each nifti file in turn (for data organized as 1 nii file per TR)
    abc = sprintf('%s%d%s','temp = MRIread(''swrfreclassified_denoised_func_data_nonaggr_00010.nii'');'); %you'll likely have to edit this to fit your data's terminology  
    eval(abc) % executes the command stored in 'abc'
 
    temp2 = temp; %this creates a new variable (temp2) that has the same basic organization as temp
        
    for n = 1:nNodes % for all ROIs in turn
        
        temp2.vol = temp.vol .* double(parc.vol==n); % creates a new 3d matrix with the nii value only for the voxels associated with each ROI
        
        ts(n,t) = nansum(temp2.vol(:)) / countmember(1,double(parc.vol==n)); % creates the average value for only those voxels associated with each ROI
  
    end
    
    sprintf('%d',t) % ticker to tell you how many time points are left
    
end
        
        
        
