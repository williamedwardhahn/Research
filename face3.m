

command1='make facetrain_init0';


[status,cmdout]=system(command1);


command2='./facetrain_init0 -n pose12.net -t face_train.list -1 face_test1.list -2 face_test2.list -e 1';


[status,cmdout]=system(command2);


w=zeros(30,32,6);


for i=1:6
    
   command3=['./hidtopgm pose12.net imageweights.pgm 32 30 ',num2str(i)]; 
   
   [status,cmdout]=system(command3);

   w(:,:,i)=imread('imageweights.pgm');
   
   
end




figure(1)
subplot(231)
imagesc(w(:,:,1))
subplot(232)
imagesc(w(:,:,2))
subplot(233)
imagesc(w(:,:,3))
subplot(234)
imagesc(w(:,:,4))
subplot(235)
imagesc(w(:,:,5))
subplot(236)
imagesc(w(:,:,6))

