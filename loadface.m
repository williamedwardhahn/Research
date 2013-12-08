



cd facephotos


dr1=dir('*+0.jpg')


f1={dr1.name}; % get only filenames to cell


for i=1:2%length(f1) % for each image
    
a=f1{i};

b=imread(a);

c=imresize(b, [60 64]);

d=rgb2gray(i)

imwrite(d,[num2str(i)'.pgm'],'pgm')

end





