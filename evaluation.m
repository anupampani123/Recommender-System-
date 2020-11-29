
    max_iter=100;
    [M1,MSE1,RMSE1,iterations1]=lowrankcompletion(X1,5,max_iter);
    subplot(1,2,1);
    plot(iterations1,RMSE1);
    xlabel('iterations');
    ylabel('MSE');
    title('plot for matrix 1')
    [M2,MSE2,RMSE2,iterations2]=lowrankcompletion(X2,5,max_iter);
    subplot(1,2,2);
    plot(iterations2,RMSE2);
    xlabel('iterations');
    ylabel('MSE');
    title('plot for matrix 2')
    MSEnet5=(MSE1+MSE2)/2;
    if( MSE2 > MSE1)
        Mfinal5=M2;
    else
        Mfinal5=M1;
    end

        
        
    
    