%Platform:-MATLAB
%Supports jpg and png formats
%Reading file in current directory
imagefiles = [dir('*.jpg');dir('*.png')];      
nfiles = length(imagefiles);    % Number of files found
x = nfiles-1

%Reading images and blending them to give the fade effect
for ii=1:x
    
   currentfilename = imagefiles(ii).name;
   currentimage1 = imread(currentfilename);
   currentimage = imresize(currentimage1,'OutputSize',[1024 1024]);
   nextfilename = imagefiles(ii+1).name;
   nextimage1 = imread(nextfilename);
   nextimage = imresize(nextimage1,'OutputSize',[1024 1024]);
   alpha=0;
   while 1.0 > alpha
        C = currentimage*(1-alpha)+ nextimage*(alpha);
        alpha = alpha + 0.02;
        imshow(C)
    end
   
end

