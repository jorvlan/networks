
function jcr = jackknife(data)

    % Variable data is time (rows) x ROI (columns)

    % Predefine output (roi,roi,time)
    jc = zeros(size(data,2),size(data,2),size(data,1)); 
    jcz = zeros(size(data,2),size(data,2),size(data,1));
    jcr = zeros(size(data,2),size(data,2),size(data,1));

    for t=1:size(data,1)
        % Create temp instance
        data_tmp = data;
        % delete t
        data_tmp(t,:)=[];
        jc(:,:,t)=corr(data_tmp);
    end

    % Correct inversion 
    jc = jc * -1;

    % Standardize JC
    jcz = bsxfun(@rdivide,bsxfun(@minus,jc,nanmean(jc,3)),nanstd(jc,[],3));

    for t = 1:size(data,1)
        jcr(:,:,t) = jcz(:,:,t) + corr(data);
    end

    for j = 1:size(data,2)
        jcr(j,j,:) = 1;
    end

end
